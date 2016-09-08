class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: Rails.application.secrets.basic_auth_user, password: Rails.application.secrets.basic_auth_password
end
