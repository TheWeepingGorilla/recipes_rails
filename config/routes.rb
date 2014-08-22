Recipes::Application.routes.draw do
  match('/', {via: :get, to: 'recipes#index'})
  match('/recipes/new', {via: :get, to: 'recipes#new'})
  match('/recipes', {via: :post, to: 'recipes#create'})
  match('/recipes/:id', {via: :get, to: 'recipes#show'})
  match('/recipes/:id', {via: :delete, to: 'recipes#destroy'})
end
