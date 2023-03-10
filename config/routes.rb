Rails.application.routes.draw do
  post '/notify', to: 'notifications#notify'
end
