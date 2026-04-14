function [] = main()
  % Using this function you can try all functionalities
  % of the program automatically. Running main() will start
  % a benchmark of game simulations and return the results
  % as plotted graphs or in the console.


  % This program was developed and optimized for 100 participants.
  % Compatible results are only guaranteed when using a TEST_SUBJECTS number divisible by 2.
  TEST_SUBJECTS = 100;
  TOTAL_GAMES = 1000;
  FAST_MODE = true;


  % Runs a benchmark of games to collect data.
  tic;
  [successfulGames, longestLoop, countSuccessfulPrisoners] = benchmark(TEST_SUBJECTS, TOTAL_GAMES, FAST_MODE);
  elapsedTime = toc;


  % These will represent the results of the benchmark.
  fprintf('> Finished in %.4fs.\n> Result: %d/%d games were successful - Win rate: %.2f%%\n', elapsedTime, successfulGames, TOTAL_GAMES, successfulGames/TOTAL_GAMES*100);
  plot_longest_loops(longestLoop, TEST_SUBJECTS, TOTAL_GAMES);
  plot_success_rates(countSuccessfulPrisoners, TEST_SUBJECTS, TOTAL_GAMES);
  permutation_example(100);
end