class ApplicationController < ActionController::Base

=begin
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
=end
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    # flash[:alert] = "You are not authorized to perform this action."
    # redirect_to(request.referrer || root_path)

    render template: 'layouts/unauthorized'
  end

end



# module SayHello
#   def hello
#     puts 'hello'
#   end
# end

# Event.hello
# Category.hello

# class Event
#   end
# end

# class Category
#  def hello
#     puts 'hola'
#   end
#  end
