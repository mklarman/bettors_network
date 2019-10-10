class MatchupsController < ApplicationController

	def create

		matchup = Matchup.new(matchup_params)

		if matchup.save!

			redirect_back(fallback_location: posts_path)

		else

			redirect_to matchups_path

		end

	end

	def index

		@matchup = Matchup.all

	end

	def edit

		@matchup = Matchup.find_by_id(params[:id])

	end

	def update

		@matchup = Matchup.find_by_id(params[:id])

		if @matchup.update(matchup_params)

			redirect_to posts_path
		else

			redirect_back(fallback_location: posts_path)

		end

	end

	private

	def matchup_params

		params.require(:matchup).permit(:date, :fav, :dog, :fav_home, :spread, :money_line, :total, :fav_score, :dog_score, :ats_winner, :total_result)

	end	
end


