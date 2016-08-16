require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  def initialize(req, res, params = {})
    @req = req
    @res = res
    @params = params
    @already_built_response = false
  end

  def already_built_response?
    @already_built_response
  end

  def redirect_to(url)
    raise 'Double render all the way across the sky! What does it mean?' if already_built_response?
    @res.set_header('Location', url)
    @res.status = 302
    session.store_session(@res)
    @already_built_response = true
  end

  def render_content(content, content_type)
    raise 'Double render all the way across the sky! What does it mean?' if already_built_response?
    @res['Content-Type'] = content_type
    @res.write(content)
    session.store_session(@res)
    @already_built_response = true
  end

  def render(template_name)
    raise 'Double render all the way across the sky! What does it mean?' if already_built_response?
    path = "views/#{self.class.name.underscore}/#{template_name}.html.erb"
    file = File.read(path)
    erb = ERB.new(file).result(binding)
    render_content(erb, 'text/html')
    @already_built_response = true
  end

  def session
    @session ||= Session.new(req)
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def invoke_action(name)
    self.send(name)
    render(name) unless already_built_response?
  end
end
