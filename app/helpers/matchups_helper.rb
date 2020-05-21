module MatchupsHelper

	def selections_check

		current_user.selections.each do |s|

			if s.matchup_id == @matchup.id

				if s.cat == "side"

					@side_check = true

				elsif s.cat == "total"

					@total_check = true


				end



			end

		end

	end

	def get_username(user_id)

		User.all.each do |u|

			if u.id == user_id

				@username = u.username

			end
		end


	end

	def get_nfl_matchups

		@nfl_matchups = []

		Matchup.all.each do |m|

			@test = m.date

			my_date = @my_date

			
			date = self.convert_date(m.date)
			
			my_date = @matchup_date

			@test2 = my_date

			if m.sport == "NFL" && my_date >= @my_date

				my_bool = false

				current_user.selections.each do |pick|

					if m.id == pick.matchup.id

						my_bool = true

					end


				end

				if my_bool == false

					@nfl_matchups.push(m)

				end

			end

		end

	end

	def get_nba_matchups

		@nba_matchups = []

		Matchup.all.each do |m|

			if m.sport == "NBA"

				@nba_matchups.push(m)

			end

		end

	end

	def get_mlb_matchups

		@mlb_matchups = []

		Matchup.all.each do |m|

			if m.sport == "MLB"

				@mlb_matchups.push(m)

			end

		end

	end

	def get_cbb_matchups

		@cbb_matchups = []

		Matchup.all.each do |m|

			if m.sport == "CBB"

				@cbb_matchups.push(m)

			end

		end

	end

	def get_cfb_matchups

		@cfb_matchups = []

		Matchup.all.each do |m|

			if m.sport == "CFB"

				@cfb_matchups.push(m)

			end

		end

	end
end
