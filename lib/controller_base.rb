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

  def invoke_action(name)
    self.send(name)
    render(name) unless already_built_response?
  end

  def prevent_double_render
    raise 'Response already rendered!' if already_built_response?
  end

  def redirect_to(url)
    prevent_double_render

    @res.status = 302
    @res['Location'] = url
    @already_built_response = true
    session.store_session(@res)

    nil
  end

  def render(template_name)
    prevent_double_render

    path = "views/#{self.class.name.underscore}/#{template_name}.html.erb"
    file = File.read(path)
    erb = ERB.new(file).result(binding)

    render_content(erb, 'text/html')
    @already_built_response = true
  end

  def render_content(content, content_type)
    prevent_double_render

    @res.write(content)
    @res['Content-Type'] = content_type
    @already_built_response = true
    session.store_session(@res)

    nil
  end

  def session
    @session ||= Session.new(req)
  end
end
