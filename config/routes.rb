Rails.application.routes.draw do
  get '/', to: 'pages#home'
  get '/update', to: 'feed#update'
end
