% Class definition file for Prisoner objects

classdef Prisoner
  properties
    badge
    success
  end

  methods
    % Constructor method
    function obj = Prisoner(badge, success)
      if nargin > 0
        obj.badge = badge;
        obj.success = success;
      end
    end
  end
end