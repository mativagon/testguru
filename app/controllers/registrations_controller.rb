class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end