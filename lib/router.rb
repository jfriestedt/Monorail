require relative ('./route')

class Router
  attr_reader :routes

  def initialize
    @routes = []
  end

  def add_route(pattern, method, controller_class, action_name)
    route = Route.new(pattern, method, controller_class, action_name)
    @routes << route
  end

  def draw(&proc)
    self.instance_eval(&proc)
  end

  [:get, :post, :put, :delete].each do |http_method|
    define_method(http_method) do |pattern, controller_class, action_name|
      add_route(pattern, http_method, controller_class, action_name)
    end
  end

  def match_req_to_route(req)
    @routes.find { |route| route.matches_request?(req) }
  end

  def run(req, res)
    route = match_req_to_route(req)

    if route
      route.run(req, res)
    else
      res.write("Your request failed.")
      res.status = 404
    end
  end
end
