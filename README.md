# Monorail
Monorail is a lightweight MVC framework inspired by Rails.

## Features
Monorail provides you with session cookies, a base controller, ERB views, and a router to direct HTTP requests.

After starting a server, you'll be able to create routes and controllers to field your HTTP requests. Controllers will use their inherited base controller functionality to field your requests and construct a response according to your views, and the response will be returned to your browser!

## Getting Started
1. Clone this repo and use `cd` to navigate to it
2. Run `bundle install`
3. Start a server by running `ruby bin/server.rb`
4. Follow the instructions below to add Controllers, Routes, and Views.

## Adding Controllers
Controllers should be added to ``app/controllers`` and must inherit from ``lib/controller_base.rb``

```ruby
# app/controllers/my_controller.rb
require '../../lib/controller_base'

class MyController < ControllerBase
  # ...
end
```

## Constructing Routes

Require your controllers at the top of `config/routes.rb`.

```ruby
require_relative ('../app/controllers/posts_controller.rb')
```

Construct routes by passing a regex, controller name, and action symbol to ``Router.draw``
```ruby
# config/routes.rb

MyRouter.draw do
  get Regexp.new("^/posts$"), PostsController, :index
  get Regexp.new("^/posts/new$"), PostsController, :new
  post Regexp.new("^/posts$"), PostsController, :create
  get Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :show
  get Regexp.new("^/posts/(?<id>\\d+)/edit$"), PostsController, :edit
  patch Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :update
  delete Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :destroy
end
```

## Creating ERB views

Add ERB views to ``app/views/``.

NB: You must name your views as `<resource_name>_controller/<template_name>.html.erb` for them to be recognized by your controllers.

```html
<!-- app/views/posts_controller/index.html.erb -->

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h1>All Posts</h1>
    <!-- ... -->
  </body>
</html>
```

## Technologies
* Ruby
* Rack
* ERB
* JSON
