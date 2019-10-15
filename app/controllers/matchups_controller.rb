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

		@my_date
		@matchup = Matchup.all
		@matchup = Matchup.new

	end

	def show

		@matchup = Matchup.find_by_id(params[:id])
		@selection = Selection.new
		@side_check = false
		@total_check = false

	end

	def edit

		@matchup = Matchup.find_by_id(params[:id])
		@probe = Probe.new

	end

	def update

		@matchup = Matchup.find_by_id(params[:id])

		if @matchup.update(matchup_params)

			redirect_to matchups_path
		else

			redirect_back(fallback_location: posts_path)

		end

	end

	def probes

		@matchups = Matchup.all

		@matchup_holder = []

	end

	private

	def matchup_params

		params.require(:matchup).permit(:date, :sport, :fav, :dog, :fav_home, :spread, :money_line, :dog_ml, :total, :fav_score, :dog_score, :ats_winner, :total_result)

	end	
end


