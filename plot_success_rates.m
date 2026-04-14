function [] = plot_success_rates(countSuccessfulPrisoners, TEST_SUBJECTS, TOTAL_GAMES)
  % This function will plot a diagram showing the propabilities for how many prisoners
  % were able to find their notes during the benchmark. The blue graph is showing the
  % test results where the strategy was applied. The green graph shows what the propabilities
  % would be if all prisoners would choose randomly during the games.
  figure;


  % Test results (choosing with strategy)
  counts = histcounts(countSuccessfulPrisoners, TEST_SUBJECTS + 1);
  propabilities = counts / TOTAL_GAMES;
  b1 = bar(0:TEST_SUBJECTS, propabilities);
  b1.FaceAlpha = 0.75;
  hold on;


  % Choosing randomly
  warning('off', 'MATLAB:nchoosek:LargeCoefficient'); % Suppress function warning
  randChoose = @(n, k, p) nchoosek(n, k) * p^k * (1-p)^(n-k); % Binomial formula
  x = 0:TEST_SUBJECTS;
  y = arrayfun(@(k) randChoose(TEST_SUBJECTS, k, 0.5), x);
  b2 = bar(x, y, 'green');
  b2.FaceAlpha = 0.5;
  warning('on', 'MATLAB:nchoosek:LargeCoefficient'); % Re-enable the warning


  xlabel('# of prisoners who found their number', 'FontSize', 14);
  ylabel('Propability', 'FontSize', 14);
  title('Propability for successful prisoners', 'FontSize', 16);
  hold off;
end