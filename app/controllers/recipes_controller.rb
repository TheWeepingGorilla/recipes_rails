class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render('recipes/index.html.erb')
  end

  def new
    @recipe = Recipe.new
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "Your recipe was saved."
      redirect_to("/")
    else
      flash[:notice] = "You messed up."
      render('recipes/new.html.erb')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "The recipe was destroyed.  Completely and utterly."
    redirect_to("/")
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(params[:recipe])
      flash[:notice] = "Recipe updated."
      redirect_to("/")
    else
      flash[:notice] = "You messed up."
      render('recipes/edit.html.erb')
    end
  end

  def add_tag
    @tags = Tag.all
    @recipe = Recipe.find(params[:id])
    render('recipes/add_tag.html.erb')
  end

  def save_tag
    @tag = Tag.find(params[:tag_id])
    @recipe = Recipe.find(params[:id])
    if @recipe.tags << @tag
      flash[:notice] = "Tag added."
      redirect_to("/recipes/#{@recipe.id}")
    end
  end

  def fresh
    @recipes = Recipe.sort_by_freshness
    render('recipes/fresh.html.erb')
  end
end
