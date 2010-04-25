class ApplicationController < ActionController::Base
  
  #Sanitizes all the input params for POST and PUT requests
  # sanitize_params
  
  include Authentication
  include GuiHelpers
  include RoutingErrors
  #include ExceptionNotifiable
  
  helper :all
  protect_from_forgery
  before_filter :set_user_time_zone
  
  private
  
  def set_user_time_zone
    Time.zone = current_user.ucontact.time_zone if (current_user && current_user.ucontact)
  end
  
  def ssl_supported?
    (ENV['RAILS_ENV'] == 'production')
  end
  
  def ssl_required
    if !request.ssl? && ssl_supported?
      redirect_to :protocol => "https"
      flash.keep
      return false
    end
  end
  
end
