class ArticlesController < ApplicationController
  def index #find all articles from database
    #Article.all runs: SELECT * FROM articles
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end
  
  def create
    puts 'Creating article'
    @article = Article.create(article_params)

    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
