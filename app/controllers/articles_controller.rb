class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.destroy(params[:id])
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Your Article has Been Updated"
      redirect_to articles_path
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end
end
