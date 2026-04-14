function [countSuccessfulGames, countedLongestLoops, countSuccessfulPrisoners] = benchmark(TEST_SUBJECTS, TOTAL_GAMES, FAST_MODE)
  % Simulate the box game a certain amount
  % of times and return the test data.
  %
  % params:
  %   TEST_SUBJECTS - how many prisoners should participate
  %   TOTAL_GAMES - how many games should be played
  %   FAST_MODE - set true if benchmark should skip unnecessary simulations
  fprintf('Benchmark started. Please wait until it is complete...\n')


  % prepare prisoners
  prisoners(TEST_SUBJECTS) = Prisoner();
  for i = 1:TEST_SUBJECTS
    prisoners(i).badge = i;
    prisoners(i).success = false;
  end


  % prepare boxes
  boxes(TEST_SUBJECTS) = Box();
  for idx = 1:TEST_SUBJECTS
    boxes(idx).label = idx;
  end


  % Initialize variables
  countedLongestLoops = zeros(1, TEST_SUBJECTS);
  countSuccessfulPrisoners = zeros(1, TOTAL_GAMES);
  h = waitbar(0, 'Running benchmark...'); % Waitbar (progress bar)


  countSuccessfulGames = 0;
  for i = 1:TOTAL_GAMES
    % Simulating one game and collecting its' results.
    [success, maxLoopLength, successfulPrisoners] = sim_game(TEST_SUBJECTS, prisoners, boxes, FAST_MODE);

    if success
      countSuccessfulGames = countSuccessfulGames + 1;
    end
    countedLongestLoops(maxLoopLength) = countedLongestLoops(maxLoopLength) + 1;
    countSuccessfulPrisoners(i) = successfulPrisoners;

    % Update waitbar according to the real benchmark progress
    waitbar(i / TOTAL_GAMES, h, sprintf('Benchmark running...\nProgress: %d%%', round((i / TOTAL_GAMES) * 100)));
  end
  close(h);
  fprintf('Benchmark completed! Results will be shown now...\n')
end