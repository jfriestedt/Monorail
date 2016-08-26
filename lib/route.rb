module Monorail
  
  class Route
    attr_reader :pattern, :http_method, :controller_class, :action_name

    def initialize(pattern, http_method, controller_class, action_name)
      @pattern = pattern
      @http_method = http_method
      @controller_class = controller_class
      @action_name = action_name
    end

    def matches_request?(req)
      (pattern =~ req.path) &&
      (http_method == req.request_method.downcase.to_sym)
    end

    def run(req, res)
      match_data = pattern.match(req.path)

      params = req.params
      param_keys = match_data.names

      param_keys.each { |key| params[key] = match_data[key] }

      controller = controller_class.new(req, res, params)
      controller.invoke_action(action_name)
    end
  end
end
