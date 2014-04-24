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

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment removed"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Unable to remove comment. Try again"
      redirect_to [@topic, @post]
    end
  end
  
end
