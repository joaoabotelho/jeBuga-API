module AuthenticateHelper

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { data:{ error: 'Not Authorized' }}, status: 401 unless @current_user
  end

end
