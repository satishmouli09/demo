Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'booking/list'
  post 'booking/list'
  get 'booking/available_bikes'
  post 'booking/create'
  get 'booking/show'
  get 'booking/cancel'
  post 'booking/cancel'
  get 'booking/extend'
  post 'booking/extend'

  get 'booking/user_bookings'

  get 'bike/list'
  post 'bike/list'
  get 'bike/booking_check'
  get 'bike/show'
  post 'bike/show'


  get 'user/new'
  post 'user/create'
end
