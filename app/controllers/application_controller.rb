# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    save_path
    unless current_user
      redirect_to login_path, alert: 'Войдите в Ваш аккаунт!'
    end
  end

  def save_path
    session[:forwarding_url] = request.original_url if request.get?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def logout
    reset_session
    @current_user = nil
  end
end
