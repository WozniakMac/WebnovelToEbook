Rack::Attack.throttle("requests by ip", limit: 5, period: 2) do |request|
  request.ip
end

Rack::Attack.throttle("create new ebook requests by ip", limit: 1, period: 60) do |request|
  if req.path == "/ebooks" && req.post?
    request.ip
  end
end
