class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :add_likes]
    before_action :set_attributes, only: [:new, :edit, :update, :create]
    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        @post.update(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def add_likes
        @post.add_like
        render :show        
    end


    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def set_attributes
        @bloggers = Blogger.all
        @destinations = Destination.all
    end
end