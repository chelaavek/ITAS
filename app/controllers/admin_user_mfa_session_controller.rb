class AdminUserMfaSessionController < ApplicationController
  def new
    @skip_header_and_footer = true
    @current_admin_user = current_admin_user
    current_admin_user.google_secret_value if current_admin_user.set_google_secret
  end

  def create
    admin_user = current_admin_user
    admin_user.mfa_secret = params[:auth][:mfa_code]
    admin_user.save!
    if admin_user.google_authentic?(params[:auth][:mfa_code])
      AdminUserMfaSession.create(admin_user)
      redirect_to '/admin'
    else
      flash[:error] = 'Wrong code'
      render :new
    end
  end
end
