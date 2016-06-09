class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :owned_post, only: [:edit, :update, :destroy]

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
        @post = current_user.posts.build
    end
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
          flash[:success] = "P0ST SUC3SSFUL"
          redirect_to posts_path
        else
          flash[:alert] = "SYSTM FA1LUR3 -- P0ST DESTR0Y3D"
          render :new
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
    def owned_post
        unless current_user == @post.user
            flash[:alert] = "That post doesn't belong to you!"
            redirect_to root_path
    end
end
end
