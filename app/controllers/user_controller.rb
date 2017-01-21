class UserController < ApplicationController
  
  def create
    user_params = params["user"].symbolize_keys
    @user = User.find_by(:phone_number => user_params[:phone_number])
    unless @user
      @user = User.new(user_params)
      @user.save!
    end
    redirect_to url_for(:controller => :bike, :action => :booking_check, :user_id => @user.id)
  end
end

