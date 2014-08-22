class SearchesController < ApplicationController
  def index
    @query = params[:search]
    @recipes = Recipe.basic_search(@query[:string])
    render('recipes/search_results.html.erb')
  end
end
