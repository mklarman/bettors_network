class CommentsController < ApplicationController

	def create

		comment = Comment.new(comment_params)

		if comment.save!

			redirect_back(fallback_location: posts_path)

		else

			redirect_to comments_path

		end

	end

	def index

		@comments = Comment.all

	end

	def edit

		@comment = Comment.find_by_id(params[:id])

	end

	def update

		@comment = Comment.find_by_id(params[:id])

		if @comment.update(comment_params)

			redirect_to posts_path
		else

			redirect_back(fallback_location: posts_path)

		end

	end

	private

	def comment_params

		params.require(:comment).permit(:user_id, :post_id, :content, :date)

	end	
end
