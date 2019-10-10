class SecretsController < ApplicationController

	def create

		secret = Secret.new(probe_params)

		if Secret.save!

			redirect_back(fallback_location: posts_path)

		else

			redirect_to comments_path

		end

	end

	def index

		@secrets = Secret.all

	end

	def edit

		@secret = Secret.find_by_id(params[:id])

	end

	def update

		@secret = Secret.find_by_id(params[:id])

		if @secret.update(secret_params)

			redirect_to posts_path
		else

			redirect_back(fallback_location: posts_path)

		end

	end

	private

	def secret_params

		params.require(:secret).permit(:user_id, :target, :content, :date)

	end	
end
