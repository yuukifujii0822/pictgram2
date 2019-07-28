class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
                           
    
    if @comment.save
      flash[:success] = "コメントを投稿しました"
      redirect_to topics_path
    else
      flash[:danger] = "コメントの投稿に失敗しました"
      render("comments/new")
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :topic_id)
    end
end
