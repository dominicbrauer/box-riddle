% Class definition file for Box objects

classdef Box
  properties
    label
    content
  end

  methods
    % Constructor method
    function obj = Box(label, content)
      if nargin > 0
        obj.label = label;
        obj.content = content;
      end
    end
  end
end