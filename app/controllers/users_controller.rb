class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:create, :user_login, :forgot_password, :reset_password]

  def index
    @user = User.all
  end

  def create
    user = User.new(set_params)
    return render json: {errors: user.errors.full_messages} unless user.save
    UserMailer.welcome_email(user).deliver_now
    render json: {message:"User Created", data: user}
  end

  def show
    current_user
  end

  def edit
    @user = current_user
  end

  def update
    return render users_path, notice: "User profile updated" if current_user.update(set_params)
    render edit_user_registration_path, alert:"Account doesn't update"
  end

  def destroy
    if current_user.destroy
      redirect_to edit_user_registration_path, notice: "Your Account doesn't deleted"
    else
      redirect_to new_user_registration_path, notice: "Your Account deleted succesfully"
      UserMailer.deletion_email(current_user).deliver_now
    end
  end

#----------------------------PRIVATE METHOD-------------------------------------

  private
    def set_params
      params.require(:user).permit(:name,:email,:mobile,:address,:encrypted_password,:type)
    end
end
