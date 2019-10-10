class ProbesController < ApplicationController

	def create

		probe = Probe.new(probe_params)

		if probe.save!

			redirect_back(fallback_location: posts_path)

		else

			redirect_to comments_path

		end

	end

	def index

		@probes = Probe.all

	end

	def edit

		@probe = Probe.find_by_id(params[:id])

	end

	def update

		@probe = Probe.find_by_id(params[:id])

		if @probe.update(probe_params)

			redirect_to posts_path
		else

			redirect_back(fallback_location: posts_path)

		end

	end

	private

	def probe_params

		params.require(:probe).permit(:user_id, :matchup_id, :research)

	end	
end
