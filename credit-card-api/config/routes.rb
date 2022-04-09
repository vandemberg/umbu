Rails.application.routes.draw do
  resources 'store_buys', only: [:create]
end
