class CommentsController < ApplicationController
  # index
  def index
    @comments = Comment.all
  end

  # new
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  # create
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    redirect_to post_path(@post)
  end

  #show
  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    redirect_to edit_post_comment_path(@post, @comment)
  end

  # edit
  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  # update
  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_path(@post)
  end

  # destroy
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :comment, :post_id)
  end
end
