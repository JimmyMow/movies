class RolesController < ApplicationController

  def index
    @roles = Role.all
  end

  def show
    @role = Role.find_by(:id => params[:id])
  end

  def new
    @movie = Movie.find_by_id(params[:movie_id])
    @actor = Actor.find_by_id(params[:actor_id])
    @actors = Actor.order(:name)
    @movies = Movie.order(:title)
  end

  def create
    @role = Role.new
    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]
    @role.name = params[:name]

    if @role.save
      redirect_to roles_url
    else
      render 'new'
    end
  end

  def edit
    @role = Role.find_by(:id => params[:id])
  end

  def update
    @role = Role.find_by(:id => params[:id])
    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]
    @role.name = params[:name]

    if @role.save
      redirect_to roles_url
    else
      render 'new'
    end
  end

  def destroy
    @role = Role.find_by(:id => params[:id])
    @role.destroy
    redirect_to roles_url
  end
end
