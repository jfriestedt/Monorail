require ('../lib/router.rb')

# Router#draw example:

# MyRouter = Router.new

# MyRouter.draw do
#   get Regexp.new("^/posts$"), PostsController, :index
#   get Regexp.new("^/posts/new$"), PostsController, :new
#   post Regexp.new("^/posts$"), PostsController, :create
#   get Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :show
#   get Regexp.new("^/posts/(?<id>\\d+)/edit$"), PostsController, :edit
#   patch Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :update
#   delete Regexp.new("^/posts/(?<id>\\d+)$"), PostsController, :destroy
# end
