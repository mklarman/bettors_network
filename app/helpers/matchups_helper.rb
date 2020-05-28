module MatchupsHelper

	def selections_check

		current_user.selections.each do |s|

			@side_check = false
			@total_check = false

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

	def show_games(array_of_objects)

		@games_to_show = []

		array_of_objects.each do |check|

			@matchup_obj = {}

			@matchup_obj[:sport] = check.sport
			@matchup_obj[:fav] = check.fav
			@matchup_obj[:dog] = check.dog
			@matchup_obj[:spread] = check.spread
			@matchup_obj[:money_line] = check.money_line
			@matchup_obj[:dog_ml] = check.dog_ml
			@matchup_obj[:total] = check.total

			if current_user.selections[0]

				current_user.selections.all.each do |sel|

					if sel.matchup_id == check.id

						if sel.choice == "Fav"

							@matchup_obj[:side_or_total] = "side"
							@matchup_obj[:selection] = check.fav + " " + check.spread.to_s


						elsif sel.choice == "Dog"

							@matchup_obj[:side_or_total] = "side"
							@matchup_obj[:selection] = check.dog + " " + (check.spread.to_f * -1)


						elsif sel.choice == "under"

							@matchup_obj[:side_or_total] = "total"
							@matchup_obj[:selection] = "Under " + check.total.to_s


						else sel.choice == "over"

							@matchup_obj[:side_or_total] = "total"
							@matchup_obj[:selection] = "Over " + check.total.to_s


						end

						@games_to_show.push(@matchup_obj)

					else

						@matchup_obj[:side_or_total] = "none"
						@matchup_obj[:selection] = "none"
						@games_to_show.push(@matchup_obj)


					end


				end

			else

				@matchup_obj[:side_or_total] = "none"
				@matchup_obj[:selection] = "none"
				@games_to_show.push(@matchup_obj)

			end
		end
	end
end
