class SessionsController < ApplicationController
   before_filter :redirect_signed_in_users, only: [:new]
  skip_before_filter :require_login,
    only: [:create, :new, :destroy],
    raise: false
  skip_before_filter :authorize,
    only: [:create, :new, :destroy],
    raise: false

	def fb_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    # byebug
    redirect_to user
  end

  def create
    @user = authenticate(params)
    session[:user_id] = @user.id
    sign_in(@user) do |status|
      if status.success?
           redirect_to @user
      else
        flash.now.notice = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
 
  end

  def destroy
    sign_out
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
    render template: "sessions/new"
  end

  private

  def redirect_signed_in_users
    if signed_in?
      redirect_to url_for_signed_in_users
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def url_after_destroy
    sign_in_url
  end

  def url_for_signed_in_users
    url_after_create
  end
end
