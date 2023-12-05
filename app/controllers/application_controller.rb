class ApplicationController < ActionController::Base

  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :update_sanitized_params, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type, :mobile, :address])
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type, :mobile, :address, :encrypted_password])
  end

  #------------------OWNER HAS RIGHT TO------------------
    def owner_has_right_to
      unless current_user.type == "Owner"
        respond_to do |format|
          format.json { render json: {message: "Customer's don't have the access"}}
          format.html { redirect_to root_path }
        end
      end
    end

end
