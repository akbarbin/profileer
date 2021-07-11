require 'jwt'

module ApiHelper
  def authenticated_header(user)
    payload = { user_id: user.id }
    token = JWT.encode(payload, ENV['HMAC_SECRET'])
  end
end
