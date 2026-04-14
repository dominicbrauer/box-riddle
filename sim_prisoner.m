function success = sim_prisoner(prisoner, boxes, TEST_SUBJECTS)
  % Simulate a single prisoner once

  trys = 0;
  currentBox = prisoner.badge;

  
  while true
    trys = trys + 1;

    if boxes(currentBox).content == prisoner.badge
      prisoner.success = true;
      break;
    elseif trys > TEST_SUBJECTS/2
      break;
    else
      currentBox = boxes(currentBox).content;
    end
  end

  success = prisoner.success;
end