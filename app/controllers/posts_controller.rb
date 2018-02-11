class PostsController < ApplicationController
  # index
  def index
    @posts = Post.all
  end

  
  private
  def post_params
    params.require(:post).permit(:name, :post_info, :title)
  end
end
