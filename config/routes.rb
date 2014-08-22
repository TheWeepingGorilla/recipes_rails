Recipes::Application.routes.draw do
  match('/', {via: :get, to: 'recipes#index'})
  match('/recipes/new', {via: :get, to: 'recipes#new'})
  match('/recipes', {via: :post, to: 'recipes#create'})
end
