Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'booking/list'
  get 'booking/new'
  post 'booking/list'
  get 'booking/available_bikes'
  get 'booking/create_booking'
  post 'booking/create'
  patch 'booking/update'
  get 'booking/list'
  get 'booking/show'
  get 'booking/edit'
  get 'booking/delete'
  get 'booking/update'
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
