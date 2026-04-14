# 100 Prisoner Riddle (Made in MATLAB)

The [100 Prisoner Riddle](https://en.wikipedia.org/wiki/100_prisoners_problem) is a game where 100 prisoners need to find the box with their number in a pregenerated room with 100 boxes. The problem or trick lies in the strategy they need to use for all prisoners to find their own numbers.


## Overview

The idea of developing this program in MATLAB came from a video about this riddle by [Veritasium](https://youtu.be/iSNsgj1OCLA?si=q_iR0iR60_i-_Ygr). I wanted to simulate the game and its' propabilities using the math features of MATLAB (random permutations, plots, etc.).

To understand the process of the game and the meaning/explanation behind the solution and propabilities, please read the `Explanation.md` file. This program is not designed to explain the outcomes but rather calculate and display them. So if parts of the results are hard to comprehend, please read the explanations.


## Functions

### `sim_game.m`
Simulating a game means that a new room is generated with boxes from 1 to $n$ containing notes labeled with numbers from 1 to n. These notes are put randomly into the boxes, meaning a box does not necessarily contains the note with its' own number on it. The Box objects and their notes are generated randomly and each prisoner is being simulated until all of them are finished.


### `sim_prisoner.m`
Simulating a game with $n$ prisoners will run this functions $n$ times. A prisoner will start opening the box with his number on it and continue opening the boxes with the numbers on the notes found in the previous boxes. He will continue this until:
1. he either opened half of the boxes in the room
2. he found his note before `1.` happened

The prisoners are programmed to use the loop strategy.


### `longest_loop.m`
This functions takes a generated room and calculates the longest loop of numbers.


### `benchmark.m`
Running a benchmark is the most crucial function of this program. It will run multiple game simulations and collect data from them. The more games you simulate, the more precise the results will be. You can choose how many prisoners (**TEST_SUBJECTS**) you want to have and how many games (**TOTAL_GAMES**) you want to simulate. A benchmark will collect the following data:
- count of successful games (all prisoners were able to find their notes)
- count of how often which number has been the longest loop of numbers in a simulated game
- count of successful prisoners in each game

The benchmark can be run in **FAST_MODE**. This will essentially skip simulating each prisoner individually and collect the result data just from the amount of prisoners and the longest loop in each game. These two variables are enough to complete a game. Especially when trying to run a benchmark of huge amounts of games or prisoners, turning fast mode ON will cut the needed calculation time by a lot.


### `main.m`
This is the main file you will work with when using this program. Running *main()* will set up a benchmark, collect its' data and display all needed results. At the top of the code, you can edit these three variables yourself:
1. `TEST_SUBJECT` - amount of prisoners participating in the benchmark
2. `TOTAL_GAMES` - amount of games to be simulated
2. `FAST_MODE` - true if benchmark should run in fast mode

Changing any other code in other files may break the program and is not recommended.


### `plot_longest_loops.m`
After a benchmark, this function will use the collected data to plot a column chart about what the propability of a number # being the longest loop in a game is.
- The blue column chart represents the actual test results.
- The red graph represents the function $f(x) = \frac{1}{x}$ showing the exact illustration of the propabilities for values greater than $n/2$. If you would run a benchmark of $\infty$ games, the blue bars would match the red graph completely.
- If you run a benchmark with 100 test subjects, a third green graph will appear, showing the left segment of a Gaussian function. This is **only an estimation** for the propabilities of values smaller than $n/2$. The blue bars in this section are reminiscent of a Gaussian function, but cannot be accurately represented by one.


### `plot_success_rates.m`
After a benchmark, this function will plot the propabilities for # successful prisoners during the simulated games. The blue bars represent the actual test results. The green bars are a result of a Bernoulli experiment where the prisoners chose randomly while playing. You can see that $n/2$ has the highest propability if all prisoners would have utilized their individual $50\%$ chances. This plot represents an interesting observation: *When using the loop strategy, you can only fail hard or succeed completely.*


### `permutation_example.m`
This function doesn't have anything to do with the benchmark and simulations itself, but it shows the concept of permutations and loops pretty well. Running *permutation_example(n)* will plot a directed graph showing the individual loops formed by a randomly generated room with $n$ boxes. It will always show after running *main()*. You can change the parameter and experiment a bit.


## Side Notes

The two `.fig` files in the projects folder are results of a benchmark with $1.000.000$ games in total which took around 20 minutes to finish in *Fast Mode*. They are the most precise results I received so far. If you want to have a more precise result, just let it run for 10 Mio. games and wait around 3 hours :).