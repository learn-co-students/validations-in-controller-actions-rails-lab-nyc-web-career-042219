class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new(author_params)
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      flash[:notice] = "invalid submission"
      render :new
    end
  end

  private

  def author_params(*args)
    params.permit(:email, :name)
  end
end
