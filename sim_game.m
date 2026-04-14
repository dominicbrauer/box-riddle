function [success, maxLoopLength, successfulPrisoners] = sim_game(TEST_SUBJECTS, prisoners, boxes, FAST_MODE)
  % Simulate the box game once
  %
  % params:
  %   TEST_SUBJECTS - how many prisoners should participate
  %   prisoners - array of 'Prisoner' objects
  %   boxes - array of 'Box' objects

  % Prepare the random notes
  notes = randperm(TEST_SUBJECTS);

  % Put notes into the boxes
  for idx = 1:TEST_SUBJECTS
    boxes(idx).content = notes(idx);
  end

  maxLoopLength = longest_loop(TEST_SUBJECTS, boxes);


  % By activating fast mode, the prisoners are not simulated individually.
  % The game checks the maxLoopLength which is enough to determine if and
  % how many prisoners would be successful. This saves a lot of time
  % when simulating a lot of games.
  if FAST_MODE
    if maxLoopLength > TEST_SUBJECTS/2
      successfulPrisoners = TEST_SUBJECTS - maxLoopLength;
      success = false;
    else
      successfulPrisoners = TEST_SUBJECTS;
      success = true;
    end
    return;
  end


  successfulPrisoners = 0;
  for prisoner = prisoners
    if sim_prisoner(prisoner, boxes, TEST_SUBJECTS)
      successfulPrisoners = successfulPrisoners + 1;
    end
  end
  

  if successfulPrisoners == TEST_SUBJECTS
    success = true;
  else
    success = false;
  end
end