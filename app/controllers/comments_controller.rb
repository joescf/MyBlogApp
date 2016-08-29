class CommentsController < ApplicationController
  before_filter :load_article, :except => :destroy
  before_filter :authenticate, :only => :destroy

  def create
    @comment = @article.comments.new(comment_params)
    @comment.save
    if @comment.save
      redirect_to @article, :notice => 'Thanks for the comment'
    else
      redirect_to @article, :alert => 'Unable to load comment'
      puts @comment
    end
  end

  def destroy
    @article = current_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, :notice => 'Comment deleted'
  end

  private
  def load_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    puts @comment
    params.require(:comment).permit(:name, :email, :body)
  end
end
