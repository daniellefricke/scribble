class PostsController < ApplicationController

    def index
        @post = Post.all
      end

    def show
        @post = Post.find(params[:id])
      end

      def edit
        @post = Post.find(params[:id])
      end

    def new
        @post = Post.new
      end

    def create
      @post = Post.create!(post_params)
      redirect_to "/posts"
      end

    def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
      end

end

private
def post_params
  params.require(:post).permit(:author, :title, :text)
end
