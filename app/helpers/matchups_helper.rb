module MatchupsHelper

	def get_time

  			 @date = Time.now.utc
  			 @date = @date.in_time_zone('Eastern Time (US & Canada)') 
			 @day = @date.strftime("%d")
			 @month = @date.strftime("%b") 
			 @year = @date.strftime("%Y") 


			 @my_date = @day << " " <<@month << " " <<@year 

  	end

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
end
