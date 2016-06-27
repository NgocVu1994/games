class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  include ApplicationHelper

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to redirect_url
  end


  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def redirect_url
    current_user.is_admin? ? admin_games_path : root_url
  end
end
