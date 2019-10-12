class TagsController < ApplicationController

	def create

		tag = Tag.new(tag_params)

		if tag.save!

			redirect_back(fallback_location: posts_path)

		else

			redirect_to comments_path

		end

	end

	def index

		@tags = Tag.all

	end

	def edit

		@tag = Tag.find_by_id(params[:id])

	end

	def search

		@users = User.all
		@tag = Tag.new
		@my_date

	end

	def update

		@tag = Tag.find_by_id(params[:id])

		if @tag.update(tag_params)

			redirect_to posts_path
		else

			redirect_back(fallback_location: posts_path)

		end

	end

	private

	def tag_params

		params.require(:tag).permit(:user_id, :tagged, :sport, :situation, :date, :cat)

	end	
end

