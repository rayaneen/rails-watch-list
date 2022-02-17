class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movie = Movie.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # we need `list_id` to associate bookmark with corresponding list
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id].to_i)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :show
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end


end
