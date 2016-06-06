class RegistrationsController < Devise::RegistrationsController
# Special voodoo-sex-magic to pass form data to Devise
  private

  def sign_up_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation, :current_password)
  end
end  
