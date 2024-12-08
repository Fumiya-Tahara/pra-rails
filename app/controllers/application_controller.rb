class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :basic_auth

  private
    def basic_auth
      authenticate_or_request_with_http_basic("Application") do |user_name, password|
        user = User.find_by(user_name: user_name)
        user&.authenticate(password)
      end
    end
end
