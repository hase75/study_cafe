class ApplicationController < ActionController::Base
  
  def after_sign_out_path_for(resource)
    customer_session_path
  end

end
