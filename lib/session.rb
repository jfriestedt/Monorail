require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @session_cookie = req.cookies['_rails_lite_app']

    @parsed_cookie = @session_cookie ? JSON.parse(@session_cookie) : {}
  end

  def [](key)
    @parsed_cookie[key]
  end

  def []=(key, val)
    @parsed_cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie(
      '_rails_lite_app',
      {path: '/', value: @parsed_cookie.to_json}
    )
  end
end
