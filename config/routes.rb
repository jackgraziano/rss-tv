Rails.application.routes.draw do
  get '/', to: 'pages#home'
  get '/update_news', to: 'feed#update_news'
  get '/update_quotes', to: 'feed#update_quotes'
  get '/update_weather', to: "feed#update_weather"
  get '/update_bbce', to: "feed#update_bbce"
end
