class SelectionsController < ApplicationController

	def create

		selection = Selection.new(selection_params)

		if selection.save!

			redirect_back(fallback_location: posts_path)

		else

			redirect_to comments_path

		end

	end

	def index

		@selections = Selection.all

	end

	def edit

		@selection = Selection.find_by_id(params[:id])

	end

	def update

		@selection = Selection.find_by_id(params[:id])

		if @selection.update(selection_params)

			redirect_to posts_path
		else

			redirect_back(fallback_location: posts_path)

		end

	end

	private

	def selection_params

		params.require(:selection).permit(:user_id, :sport, :matchup_id, :cat, :choice)

	end	
end
