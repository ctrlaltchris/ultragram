class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!  
    def post_params
        params.require(:post).permit(:image, :caption)
    end
    def set_post
        @post = Post.find(params[:id])
    end
    def index
        @post = Post.all
    end
    def new
        @post = Post.new
    end
    def create
        if @post = Post.create(post_params)
            flash[:success] = "P0ST SUC3SSFUL"
            redirect_to posts_path
        else
            flash[:alert] = "SYSTM FA1LUR3 -- P0ST DESTR0Y3D"
        end
    end
    def show
    end
    def edit
    end
    def update
        if @post.update(post_params)
            flash[:success] = "P0ST SUC3SSFUL"
            redirect_to posts_path
        else
            flash.now[:alert] = "SYSTM FA1LUR3 -- P0ST DESTR0Y3D"
            render :edit
        end
    end
    def destroy
        @post.destroy
        flash.now[:success] = "P0ST DESTR0Y3D"
        redirect_to posts_path
    end
end
