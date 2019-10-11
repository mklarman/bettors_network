class PostsController < ApplicationController

	def create

		post = Post.new(post_params)

		if post.save!

			redirect_back(fallback_location: posts_path)

		else

			redirect_to comments_path

		end

	end

	def show

		@post = Post.find_by_id(params[:id])
		@comment = Comment.new

		@my_date

	end

	def index

		@posts = Post.all
		@post = Post.new

	end

	def edit

		@post = Post.find_by_id(params[:id])

	end

	def update

		@post = Post.find_by_id(params[:id])

		if @post.update(post_params)

			redirect_to posts_path
		else

			redirect_back(fallback_location: posts_path)

		end

	end

	private

	def post_params

		params.require(:post).permit(:user_id, :content, :date, :title)

	end	
end
