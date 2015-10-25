class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
<<<<<<< HEAD
    sort = params[:sort] || session[:sort]
    case sort
    when 'title'
      ordering,@title_header = {:sort => :title},'hilite'
    when 'release_date'
      ordering,@date_header = {:sort => :release_date},'hilite'
    end
    
    @all_ratings = Movie.all_ratings
    @selected_ratings = params[:ratings] || session[:ratings] || {}
    puts @selected_ratings
    if @selected_ratings == {}
      @selected_ratings = Hash[@all_ratings.map {|rating| [rating, rating]}]
    end
    if params[:sort] != session[:sort]
      session[:sort] = sort
      flash.keep
      redirect_to :sort => sort, :ratings => @selected_ratings and return
    end

    if params[:ratings] != session[:ratings] and @selected_ratings != {}
      session[:sort] = sort
      session[:ratings] = @selected_ratings
      flash.keep
      redirect_to :sort => sort, :ratings => @selected_ratings and return
    end
    # sort by request
    # Note: There some tricky thing for method find
    # @movies =  Movie.find(:all,:order=>ordering[:sort],:conditions=>['rating IN (?)', @selected_ratings.keys])
    @movies =  Movie.where(rating: @selected_ratings.keys).order(ordering[:sort]).all
    print @movies
  end

  def new 
=======
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
>>>>>>> 9cbc95e0cc6b2d928c2a4337532d9e715c362242
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
<<<<<<< HEAD
=======

>>>>>>> 9cbc95e0cc6b2d928c2a4337532d9e715c362242
end
