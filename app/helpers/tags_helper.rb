module TagsHelper

	def get_nfl_records

		User.all.each do |u|

			side_winners = 0
			side_losers = 0

			total_winners = 0
			total_losers = 0

			u.selections.each do |s|

				if s.sport == "NFL"

					Matchup.all.each do |m|

						if m.id == s.matchup_id

							if m.ats_winner.length > 0

								if s.cat == "side"

									if s.choice == m.ats_winner

										side_winners += 1

									else

										if s.choice != m.ats_winner && m.ats_winner != "push"

											side_losers += 1

										end

									end

								else

									if s.choice == m.total_result

										total_winners += 1

									elsif s.choice != m.total_result && m.total_result != "push"

										total_losers += 1

									end

								end

							end
						end

					end

				end

			end

			user_obj = Hash.new

			user_obj[:user_id] = u.id
			user_obj[:side_selections] = side_winners + side_losers 
			user_obj[:total_selections] = total_winners + total_losers 
			user_obj[:all_selections] = total_winners + total_losers + side_losers + side_winners
			user_obj[:sides_rec] = side_winners.to_s + " - " + side_losers.to_s 
			user_obj[:sides_prcnt] = (side_winners.to_f / (side_winners.to_f + side_losers.to_f)).round(2) 
			user_obj[:sides_prcnt] = user_obj[:sides_prcnt].to_s + "%" 

			user_obj[:totals_prcnt] = (total_winners.to_f / (total_winners.to_f + total_losers.to_f)).round(2) 
			user_obj[:totals_prcnt] = user_obj[:totals_prcnt].to_s + "%" 

		end


	end
end
