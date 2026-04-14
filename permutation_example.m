function [] = permutation_example(BOX_COUNT)
  % This function plots directed graphs for a random permutation of 100 numbers.
  % It simulates the generation of a random room and shows the loops
  % created by the boxes and notes.
  %
  % params:
  %   BOX_COUNT - How many boxes to simulate
  figure;


  notes = randperm(BOX_COUNT);
  usedNum = zeros(BOX_COUNT);
  s = [];
  t = [];


  for idx = 1:BOX_COUNT
    if usedNum(idx) % Numbers that are already present in another loop are skipped
      continue;
    end
    s(end+1) = idx;
    
    while true
      content = notes(s(end));
      t(end+1) = content;
      if content == idx % Loop is back at where it started
        break;
      end
      s(end+1) = content;
      usedNum(content) = true;
    end
  end


  G = digraph(s, t);
  plot(G, ...
    "ArrowSize", 14, ...
    "NodeFontSize", 16, ...
    "Layout", "force", ...
    "NodeFontAngle", "normal", ...
    "Marker", "diamond", ...
    "MarkerSize", 6, ...
    "LineWidth", 1.5 ...
  );
  title('Closed loops created by random permutation', 'FontSize', 20);
end