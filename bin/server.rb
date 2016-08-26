require 'rack'
require_relative '../lib/router'
require_relative '../lib/controller_base'
require_relative '../config/routes.rb'

# require controllers here

# e.g:
# require_relative '../app/controllers/my_controller.rb'

app = Rack::Builder.app do
  run lambda { |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
    MyRouter.run(req, res)
    res.finish
  }
end

Rack::Server.start(
  app: app,
  Port: 3000
)
