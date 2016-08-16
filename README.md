# Monorail
Monorail is a lightweight MVC framework inspired by Rails.

## Features
Monorail provides you with a Rack server, session cookies, a base controller, and a router to direct HTTP requests, without the bloat and scaffolding of a full-scale Rails project.

## Getting Started
To start a Monorail project, simply clone this repo locally.

## Adding controllers
Controllers should be added to ``app/controllers`` and must inherit from ``lib/controller_base.rb``

```ruby
# app/controllers/my_controller.rb
require '../../lib/controller_base'

class MyController < ControllerBase
  # ...
end
```

## Adding routes
```
add_route(pattern, method, controller_class, action_name)
```


## Technologies
* Ruby
* Rack
* ERB
* JSON
