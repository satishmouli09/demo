class UserController < ApplicationController
  
  def create
    user_params = params["user"].symbolize_keys
    @user = User.find_by(:phone_number => user_params[:phone_number])
    puts "000000000000000000000#{user_params}00000000000000000000"
    unless @user
      @user = User.new(user_params)
      @user.save!
    end
    redirect_to url_for(:controller => :bike, :action => :booking_check, :user_id => @user.id)
  end
end

