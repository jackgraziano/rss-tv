Rails.application.routes.draw do
  get '/', to: 'pages#home'
  get '/update_news', to: 'feed#update_news'
  get '/update_quotes', to: 'feed#update_quotes'
end
