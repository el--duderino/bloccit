class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    if @comment.save
      flash[:notice] = "Comment saved"
      redirect_to [@topic, @comment.post]
    else
      flash[:error] = "Unable to save comment"
      redirect_to [@topic, @comment.post]
    end
  end
end
