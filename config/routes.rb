Rails.application.routes.draw do
  namespace :api do
    resource :user

    resource :session, only: [:create, :destroy]
  end

  namespace :admin do

  end
end
