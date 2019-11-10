class MoviesController < ApplicationController
  def index
    if params[:actor].present?
      movies = Movie.where(actor: params[:actor])
    else
      movies = Movie.all
    end
    render json: movies, status: :ok
  end

  def actors
    actors = Movie.all.map(&:actor).uniq

    render json: actors
  end
end
