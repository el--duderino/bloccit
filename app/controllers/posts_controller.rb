class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    authorize @post;
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post.topic = @topic
    authorize @post
    if @post.save
      redirect_to [@topic, @post], notice: "Post was created successfully."
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post

    if @post.update_attributes(params.require(:post).permit(:title, :body))
      redirect_to [@topic, @post], notice: "Post was updated successfully."
    else
      flash[:error] = "There was an error saving the post. Please try again"
      render :edit
    end
  end
end
