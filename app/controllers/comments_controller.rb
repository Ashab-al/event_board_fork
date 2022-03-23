class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @article.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      redirect_to @article, notice: I18n.t('controllers.comments.created')
    else
      redirect_to 'article/show', notice: I18n.t('controllers.comments.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.comments.destroyed')}

    if current_user_can_edit(@comment)
      @comment.destroy!
    else
      message = {alert: I18n.t('controllers.comments.error')}
    end
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_comment
      @comment = @article.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_name)
    end
end
