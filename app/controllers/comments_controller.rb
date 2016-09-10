class CommentsController < ApplicationController
  before_filter :load_article, :except => :destroy
  before_filter :authenticate, :only => :destroy

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @article, :notice => 'Thanks for the comment' }
        format.js
        NotifierMailer.comment_added(@comment).deliver
      end
    else
      respond_to do |format|
        format.html { redirect_to @article, :alert => 'Unable to load comment' }
        format.js { render 'fail_create.js.erb'}
      end
    end
  end

  def destroy
    @article = current_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @article, :notice => 'Comment deleted' }
      format.js
    end
  end

  private
  def load_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :email, :name)
  end
end
