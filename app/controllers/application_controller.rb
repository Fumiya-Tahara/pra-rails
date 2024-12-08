class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :basic_auth

  private
    def basic_auth
      authenticate_or_request_with_http_basic("Application") do |user_name, password|
        user = User.find_by(user_name: user_name)
        if user&.authenticate(password)
          @current_user = user
        else
          request_http_basic_authentication
        end
      end
    end

  def current_user
    @current_user
  end
end
