Rails.application.routes.draw do
   # Add a route to access my notifications controller
    post 'api/v1/notify', to: 'api/v1/notifications#notify'
end
