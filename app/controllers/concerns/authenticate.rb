module Authenticate
  extend ActiveSupport::Concern

  SECRET = "my$ecretKey"

  def authenticate_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    begin
      decoded = JWT.decode(token, SECRET, true, algorithm: 'HS256')
      @current_user = decoded[0]
    rescue
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end