class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate
  
  private
  
  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      if (credentials_valid = ['veja', 'exame', 'recreio'].include?(user) && password == 'pwd')
        session[:brand] = user.upcase
      end
      
      credentials_valid
    end
  end
end
