class ArticlesController < ApplicationController
  respond_to :html, :js
  
  def index
    @articles = Article.paginate :page => params[:page]
    respond_with(@articles)
  end

  def show
  end

end
