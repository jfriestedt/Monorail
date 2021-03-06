require 'json'

class Session
  attr_accessor :parsed_cookie

  def initialize(req)
    session_cookie = req.cookies["_monorail_app"]
    @parsed_cookie = session_cookie ? JSON.parse(session_cookie) : {}
  end

  def [](key)
    parsed_cookie[key]
  end

  def []=(key, val)
    parsed_cookie[key] = val
  end

  def store_session(res)
    cookie = { path: '/', value: parsed_cookie.to_json }
    res.set_cookie("_monorail_app", cookie)
  end
end
