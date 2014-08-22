class TagsController < ApplicationController
  def index
    @tags = Tag.all
    render('tags/index.html.erb')
  end

  def new
    @tag = Tag.new
    render('tags/new.html.erb')
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "Your tag was saved."
      redirect_to("/")
    else
      flash[:notice] = "You messed up."
      render('tags/new.html.erb')
    end
  end

  def show
    @tag = Tag.find(params[:id])
    render('tags/show.html.erb')
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "The tag was destroyed.  Completely and utterly."
    redirect_to("/")
  end

  def edit
    @tag = Tag.find(params[:id])
    render('tags/edit.html.erb')
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(params[:tag])
      flash[:notice] = "tag updated."
      redirect_to("/")
    else
      flash[:notice] = "You messed up."
      render('tags/edit.html.erb')
    end
  end
end
