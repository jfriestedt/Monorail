require_relative ('../lib/router.rb')

# require controllers here:

# e.g:
# require_relative('../app/controllers/posts_controller.rb')

MyRouter = Monorail::Router.new

MyRouter.draw do
# Draw routes according to this example:

  # get Regexp.new("^/posts$"), PostsController, :index
  # get Regexp.new("^/posts/new$"), PostsController, :new
  # post Regexp.new("^/posts$"), PostsController, :create
  # get Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :show
  # get Regexp.new("^/posts/(?<id>\\d+)/edit$"), PostsController, :edit
  # patch Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :update
  # delete Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :destroy
end
