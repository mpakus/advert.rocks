class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render inline: '404 error', status: :not_found, layout: false
  end

  def set_locale
    languages = %w(ru en)
    if params[:lang] && languages.include?(params[:lang])
      cookies[:language] = params[:lang]
    end
    @current_language  = cookies[:language]
    unless languages.include?(@current_language)
      @current_language = http_accept_language.preferred_language_from(languages)
    end
    I18n.locale = @current_language.to_sym
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
