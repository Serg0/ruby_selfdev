class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end


  def index_query_count
      if session[:counter].nil?
        session[:counter] = 1
      else
        session[:counter] += 1
      end
  end

  def reset_index_counter
    session[:counter] = 0
  end

end
