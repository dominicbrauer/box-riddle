function [] = plot_longest_loops(longestLoop, TEST_SUBJECTS, TOTAL_GAMES)
  % Plot benchmark result for longest loops. What was the propability
  % for # to be the longest loop in a simulated game.
  %
  % params:
  %   longestLoop - array of results
  %   TEST_SUBJECTS - number of participants in the games
  %   TOTAL_GAMES - how many games were played during the benchmark
  figure;

  
  % Plot real benchmark results (blue graph)
  bar(1:TEST_SUBJECTS, longestLoop./TOTAL_GAMES);
  hold on;


  % Plot estimation graph for winning cases (green graph) - only for 100 prisoners
  if TEST_SUBJECTS == 100
    mu = 50;
    sigma = 10.08;
    A = 0.02078;
    x1 = 1:(TEST_SUBJECTS/2 - 1);
    y2 = A * exp(-((x1 - mu).^2) / (2 * sigma^2)); % Gaussian function
    plot(x1, y2, 'g', 'LineWidth', 2);
  end


  % Plot real propability graph for losing cases (red graph)
  x2 = (TEST_SUBJECTS/2):TEST_SUBJECTS;
  plot(x2, 1./x2, 'r', 'LineWidth', 2);
  

  xlabel('Longest Loop', 'FontSize', 14);
  ylabel('Propability', 'FontSize', 14);
  title('Propability for longest loop', 'FontSize', 16);
  hold off;
end