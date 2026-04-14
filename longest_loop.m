function maxSteps = longest_loop(TEST_SUBJECTS, boxes)
  % Returns the longest loop in the current game

  maxSteps = 0;


  for i = 1:TEST_SUBJECTS
    steps = 1;
    content = boxes(i).content;

    while content ~= i
      content = boxes(content).content;
      steps = steps + 1;
    end

    if steps > maxSteps
      maxSteps = steps;
    end
  end
end