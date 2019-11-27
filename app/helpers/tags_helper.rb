module TagsHelper

	def get_nfl_records

		User.all.each do |u|

			side_winners = 0
			side_losers = 0

			total_winners = 0
			total_losers = 0

			home_winners = 0
			home_losers = 0

			road_winners = 0
			road_losers = 0

			home_low_fav_winners = 0
			home_low_fav_losers = 0

			home_low_dog_winners = 0
			home_low_dog_losers = 0

			home_mid_fav_winners = 0
			home_mid_fav_losers = 0

			home_mid_dog_winners = 0
			home_mid_dog_losers = 0

			home_big_fav_winners = 0
			home_big_fav_losers = 0

			home_big_dog_winners = 0
			home_big_dog_losers = 0

			road_low_fav_winners = 0
			road_low_fav_losers = 0

			road_low_dog_winners = 0
			road_low_dog_losers = 0

			road_mid_fav_winners = 0
			road_mid_fav_losers = 0

			road_mid_dog_winners = 0
			road_mid_dog_losers = 0

			road_big_fav_winners = 0
			road_big_fav_losers = 0

			road_big_dog_winners = 0
			road_big_dog_losers = 0

			low_spread_winners = 0
			low_spread_losers = 0

			mid_spread_winners = 0
			mid_spread_losers = 0

			big_spread_winners = 0
			big_spread_losers = 0

			low_total_winners = 0
			low_total_losers = 0
			
			mid_total_winners = 0
			mid_total_losers = 0
			
			big_total_winners = 0
			big_total_losers = 0

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

									if m.fav_home == true && s.choice == m.fav

										if s.choice == m.ats_winner

											home_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												home_losers += 1

											end

										end


									elsif m.fav_home == false && s.choice == m.dog

										if s.choice == m.ats_winner

											home_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												home_losers += 1

											end

										end


									else

										if s.choice == m.ats_winner

											road_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												road_losers += 1

											end

										end


									end

									if m.spread.to_f <= 3.0

										if s.choice == m.ats_winner

											low_spread_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												low_spread_losers += 1

											end

										end

										if m.fav_home == true && s.choice == m.fav

											if s.choice == m.ats_winner

												home_low_fav_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_low_fav_losers += 1

												end

											end


										elsif m.fav_home == false && s.choice == m.dog

											if s.choice == m.ats_winner

												home_low_dog_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_low_dog_losers += 1

												end

											end

										else

											if m.fav_home == true

												if s.choice == m.ats_winner

													road_low_dog_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_low_dog_losers += 1

													end

												end

											else

												if s.choice == m.ats_winner

													road_low_fav_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_low_fav_losers += 1

													end

												end


											end


										end


									elsif m.spread.to_f > 3.0 && m.spread.to_f <= 7.0

										if s.choice == m.ats_winner

											mid_spread_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												mid_spread_losers += 1

											end

										end

										if m.fav_home == true && s.choice == m.fav

											if s.choice == m.ats_winner

												home_mid_fav_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_mid_fav_losers += 1

												end

											end


										elsif m.fav_home == false && s.choice == m.dog

											if s.choice == m.ats_winner

												home_mid_dog_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_mid_dog_losers += 1

												end

											end

										else

											if m.fav_home == true

												if s.choice == m.ats_winner

													road_mid_dog_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_mid_dog_losers += 1

													end

												end

											else

												if s.choice == m.ats_winner

													road_mid_fav_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_mid_fav_losers += 1

													end

												end


											end


										end

									else

										if s.choice == m.ats_winner

											big_spread_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												big_spread_losers += 1

											end

										end

										if m.fav_home == true && s.choice == m.fav

											if s.choice == m.ats_winner

												home_big_fav_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_big_fav_losers += 1

												end

											end


										elsif m.fav_home == false && s.choice == m.dog

											if s.choice == m.ats_winner

												home_big_dog_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_big_dog_losers += 1

												end

											end

										else

											if m.fav_home == true

												if s.choice == m.ats_winner

													road_big_dog_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_big_dog_losers += 1

													end

												end

											else

												if s.choice == m.ats_winner

													road_big_fav_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_big_fav_losers += 1

													end

												end


											end


										end


									end


								else

									if s.choice == m.total_result

										total_winners += 1

									elsif s.choice != m.total_result && m.total_result != "push"

										total_losers += 1

									end

									if m.total.to_f <= 43

										if s.choice == m.total_result

											low_total_winners += 1

										elsif s.choice != m.total_result && m.total_result != "push"

											low_total_losers += 1

										end


									elsif m.total.to_f >= 43.5 && m.total.to_f <= 46.5

										if s.choice == m.total_result

											mid_total_winners += 1

										elsif s.choice != m.total_result && m.total_result != "push"

											mid_total_losers += 1

										end

									else

										if s.choice == m.total_result

											big_total_winners += 1

										elsif s.choice != m.total_result && m.total_result != "push"

											big_total_losers += 1

										end

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
			user_obj[:all_record] = (total_winners + side_winners).to_s + " - " + (side_losers + total_losers).to_s
			user_obj[:sides_rec] = side_winners.to_s + " - " + side_losers.to_s
			user_obj[:home_record] = home_winners.to_s + " - " + home_losers.to_s 

			if (side_winners != 0 && side_losers != 0)

				user_obj[:sides_prcnt] = (side_winners.to_f / (side_winners.to_f + side_losers.to_f)).round(2)
				user_obj[:sides_prcnt] = user_obj[:sides_prcnt].to_s + "%"
				user_obj[:all_prcnt] = (((total_winners + side_winners ) / (side_losers + total_losers)).round(2)).to_s + "%"

				if (home_winners != 0 && home_losers != 0)

					user_obj[:home_record] = home_winners.to_s + " - " + home_losers.to_s
					user_obj[:home_prcnt] = (home_winners.to_f / (home_winners.to_f + home_losers.to_f)).round(2)
					user_obj[:home_prcnt] = user_obj[:home_prcnt].to_s + "%"
				end

				if (road_winners != 0 && road_losers != 0)

					user_obj[:home_record] = home_winners.to_s + " - " + home_losers.to_s
					user_obj[:home_prcnt] = (home_winners.to_f / (home_winners.to_f + home_losers.to_f)).round(2)
					user_obj[:home_prcnt] = user_obj[:home_prcnt].to_s + "%"

				end


			end 
			 
			
			 
			 
			user_obj[:total_rec] = total_winners.to_s + " - " + total_losers.to_s

			user_obj[:totals_prcnt] = (total_winners.to_f / (total_winners.to_f + total_losers.to_f)).round(2) 
			user_obj[:totals_prcnt] = user_obj[:totals_prcnt].to_s + "%"
			
			
			

			user_obj[:road_record] = road_winners.to_s + " - " + road_losers.to_s
			user_obj[:road_prcnt] = (road_winners.to_f / (road_winners.to_f + road_losers.to_f)).round(2)
			user_obj[:road_prcnt] = user_obj[:road_prcnt].to_s + "%"

			user_obj[:home_low_fav_record] = home_low_fav_winners.to_s + " - " + home_low_fav_losers.to_s
			user_obj[:home_low_fav_prcnt] = (home_low_fav_winners.to_f / (home_low_fav_winners.to_f + home_low_fav_losers.to_f)).round(2)
			user_obj[:home_low_fav_prcnt] = user_obj[:home_low_fav_prcnt].to_s + "%"

			user_obj[:home_mid_fav_record] = home_mid_fav_winners.to_s + " - " + home_mid_fav_losers.to_s
			user_obj[:home_mid_fav_prcnt] = (home_mid_fav_winners.to_f / (home_mid_fav_winners.to_f + home_mid_fav_losers.to_f)).round(2)
			user_obj[:home_mid_fav_prcnt] = user_obj[:home_mid_fav_prcnt].to_s + "%"

			user_obj[:home_big_fav_record] = home_big_fav_winners.to_s + " - " + home_big_fav_losers.to_s
			user_obj[:home_big_fav_prcnt] = (home_big_fav_winners.to_f / (home_big_fav_winners.to_f + home_big_fav_losers.to_f)).round(2)
			user_obj[:home_big_fav_prcnt] = user_obj[:home_big_fav_prcnt].to_s + "%"

			user_obj[:home_low_dog_record] = home_low_dog_winners.to_s + " - " + home_low_dog_losers.to_s
			user_obj[:home_low_dog_prcnt] = (home_low_dog_winners.to_f / (home_low_dog_winners.to_f + home_low_dog_losers.to_f)).round(2)
			user_obj[:home_low_dog_prcnt] = user_obj[:home_low_dog_prcnt].to_s + "%"

			user_obj[:home_mid_dog_record] = home_mid_dog_winners.to_s + " - " + home_mid_dog_losers.to_s
			user_obj[:home_mid_dog_prcnt] = (home_mid_dog_winners.to_f / (home_mid_dog_winners.to_f + home_mid_dog_losers.to_f)).round(2)
			user_obj[:home_mid_dog_prcnt] = user_obj[:home_mid_dog_prcnt].to_s + "%"

			user_obj[:home_big_dog_record] = home_big_dog_winners.to_s + " - " + home_big_fav_losers.to_s
			user_obj[:home_big_dog_prcnt] = (home_big_dog_winners.to_f / (home_big_dog_winners.to_f + home_big_dog_losers.to_f)).round(2)
			user_obj[:home_big_dog_prcnt] = user_obj[:home_big_dog_prcnt].to_s + "%"

			user_obj[:road_low_fav_record] = road_low_fav_winners.to_s + " - " + road_low_fav_losers.to_s
			user_obj[:road_low_fav_prcnt] = (road_low_fav_winners.to_f / (road_low_fav_winners.to_f + road_low_fav_losers.to_f)).round(2)
			user_obj[:road_low_fav_prcnt] = user_obj[:road_low_fav_prcnt].to_s + "%"

			user_obj[:road_mid_fav_record] = road_mid_fav_winners.to_s + " - " + road_mid_fav_losers.to_s
			user_obj[:road_mid_fav_prcnt] = (road_mid_fav_winners.to_f / (road_mid_fav_winners.to_f + road_mid_fav_losers.to_f)).round(2)
			user_obj[:road_mid_fav_prcnt] = user_obj[:road_mid_fav_prcnt].to_s + "%"

			user_obj[:road_big_fav_record] = road_big_fav_winners.to_s + " - " + road_big_fav_losers.to_s
			user_obj[:road_big_fav_prcnt] = (road_big_fav_winners.to_f / (road_big_fav_winners.to_f + road_big_fav_losers.to_f)).round(2)
			user_obj[:road_big_fav_prcnt] = user_obj[:road_big_fav_prcnt].to_s + "%"

			user_obj[:road_low_dog_record] = road_low_dog_winners.to_s + " - " + road_low_dog_losers.to_s
			user_obj[:road_low_dog_prcnt] = (road_low_dog_winners.to_f / (road_low_dog_winners.to_f + road_low_dog_losers.to_f)).round(2)
			user_obj[:road_low_dog_prcnt] = user_obj[:road_low_dog_prcnt].to_s + "%"

			user_obj[:road_mid_dog_record] = road_mid_dog_winners.to_s + " - " + road_mid_dog_losers.to_s
			user_obj[:road_mid_dog_prcnt] = (road_mid_dog_winners.to_f / (road_mid_dog_winners.to_f + road_mid_dog_losers.to_f)).round(2)
			user_obj[:road_mid_dog_prcnt] = user_obj[:road_mid_dog_prcnt].to_s + "%"

			user_obj[:road_big_dog_record] = road_big_dog_winners.to_s + " - " + road_big_fav_losers.to_s
			user_obj[:road_big_dog_prcnt] = (road_big_dog_winners.to_f / (road_big_dog_winners.to_f + road_big_dog_losers.to_f)).round(2)
			user_obj[:road_big_dog_prcnt] = user_obj[:road_big_dog_prcnt].to_s + "%"

			user_obj[:low_spread_record] = low_spread_winners.to_s + " - " + low_spread_losers.to_s
			user_obj[:low_spread_prcnt] = (low_spread_winners.to_f / (low_spread_losers.to_f + low_spread_winners.to_f)).round(2)
			user_obj[:low_spread_prcnt] = user_obj[:low_spread_prcnt].to_s + "%"

			user_obj[:mid_spread_record] = mid_spread_winners.to_s + " - " + mid_spread_losers.to_s
			user_obj[:mid_spread_prcnt] = (mid_spread_winners.to_f / (mid_spread_losers.to_f + mid_spread_winners.to_f)).round(2)
			user_obj[:mid_spread_prcnt] = user_obj[:mid_spread_prcnt].to_s + "%"

			user_obj[:big_spread_record] = big_spread_winners.to_s + " - " + big_spread_losers.to_s
			user_obj[:big_spread_prcnt] = (big_spread_winners.to_f / (big_spread_losers.to_f + big_spread_winners.to_f)).round(2)
			user_obj[:big_spread_prcnt] = user_obj[:big_spread_prcnt].to_s + "%"

			user_obj[:low_total_record] = low_total_winners.to_s + " - " + low_total_losers.to_s
			user_obj[:low_total_prcnt] = (low_total_winners.to_f / (low_total_losers.to_f + low_total_winners.to_f)).round(2)
			user_obj[:low_total_prcnt] = user_obj[:low_total_prcnt].to_s + "%"

			user_obj[:mid_total_record] = mid_total_winners.to_s + " - " + mid_total_losers.to_s
			user_obj[:mid_total_prcnt] = (mid_total_winners.to_f / (mid_total_losers.to_f + mid_total_winners.to_f)).round(2)
			user_obj[:mid_total_prcnt] = user_obj[:mid_total_prcnt].to_s + "%"

			user_obj[:big_total_record] = big_total_winners.to_s + " - " + big_total_losers.to_s
			user_obj[:big_total_prcnt] = (big_total_winners.to_f / (big_total_losers.to_f + big_total_winners.to_f)).round(2)
			user_obj[:big_total_prcnt] = user_obj[:big_total_prcnt].to_s + "%"

			@all_nfl.push(user_obj) 

		end


	end

	def get_nba_records

		User.all.each do |u|

			side_winners = 0
			side_losers = 0

			total_winners = 0
			total_losers = 0

			home_winners = 0
			home_losers = 0

			road_winners = 0
			road_losers = 0

			home_low_fav_winners = 0
			home_low_fav_losers = 0

			home_low_dog_winners = 0
			home_low_dog_losers = 0

			home_mid_fav_winners = 0
			home_mid_fav_losers = 0

			home_mid_dog_winners = 0
			home_mid_dog_losers = 0

			home_big_fav_winners = 0
			home_big_fav_losers = 0

			home_big_dog_winners = 0
			home_big_dog_losers = 0

			road_low_fav_winners = 0
			road_low_fav_losers = 0

			road_low_dog_winners = 0
			road_low_dog_losers = 0

			road_mid_fav_winners = 0
			road_mid_fav_losers = 0

			road_mid_dog_winners = 0
			road_mid_dog_losers = 0

			road_big_fav_winners = 0
			road_big_fav_losers = 0

			road_big_dog_winners = 0
			road_big_dog_losers = 0

			low_spread_winners = 0
			low_spread_losers = 0

			mid_spread_winners = 0
			mid_spread_losers = 0

			big_spread_winners = 0
			big_spread_losers = 0

			low_total_winners = 0
			low_total_losers = 0
			
			mid_total_winners = 0
			mid_total_losers = 0
			
			big_total_winners = 0
			big_total_losers = 0

			u.selections.each do |s|

				if s.sport == "NBA"

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

									if m.fav_home == true && s.choice == m.fav

										if s.choice == m.ats_winner

											home_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												home_losers += 1

											end

										end


									elsif m.fav_home == false && s.choice == m.dog

										if s.choice == m.ats_winner

											home_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												home_losers += 1

											end

										end


									else

										if s.choice == m.ats_winner

											road_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												road_losers += 1

											end

										end


									end

									if m.spread.to_f <= 3.0

										if s.choice == m.ats_winner

											low_spread_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												low_spread_losers += 1

											end

										end

										if m.fav_home == true && s.choice == m.fav

											if s.choice == m.ats_winner

												home_low_fav_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_low_fav_losers += 1

												end

											end


										elsif m.fav_home == false && s.choice == m.dog

											if s.choice == m.ats_winner

												home_low_dog_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_low_dog_losers += 1

												end

											end

										else

											if m.fav_home == true

												if s.choice == m.ats_winner

													road_low_dog_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_low_dog_losers += 1

													end

												end

											else

												if s.choice == m.ats_winner

													road_low_fav_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_low_fav_losers += 1

													end

												end


											end


										end


									elsif m.spread.to_f > 3.0 && m.spread.to_f <= 6.0

										if s.choice == m.ats_winner

											mid_spread_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												mid_spread_losers += 1

											end

										end

										if m.fav_home == true && s.choice == m.fav

											if s.choice == m.ats_winner

												home_mid_fav_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_mid_fav_losers += 1

												end

											end


										elsif m.fav_home == false && s.choice == m.dog

											if s.choice == m.ats_winner

												home_mid_dog_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_mid_dog_losers += 1

												end

											end

										else

											if m.fav_home == true

												if s.choice == m.ats_winner

													road_mid_dog_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_mid_dog_losers += 1

													end

												end

											else

												if s.choice == m.ats_winner

													road_mid_fav_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_mid_fav_losers += 1

													end

												end


											end


										end

									else

										if s.choice == m.ats_winner

											big_spread_winners += 1

										else

											if s.choice != m.ats_winner && m.ats_winner != "push"

												big_spread_losers += 1

											end

										end

										if m.fav_home == true && s.choice == m.fav

											if s.choice == m.ats_winner

												home_big_fav_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_big_fav_losers += 1

												end

											end


										elsif m.fav_home == false && s.choice == m.dog

											if s.choice == m.ats_winner

												home_big_dog_winners += 1

											else

												if s.choice != m.ats_winner && m.ats_winner != "push"

													home_big_dog_losers += 1

												end

											end

										else

											if m.fav_home == true

												if s.choice == m.ats_winner

													road_big_dog_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_big_dog_losers += 1

													end

												end

											else

												if s.choice == m.ats_winner

													road_big_fav_winners += 1

												else

													if s.choice != m.ats_winner && m.ats_winner != "push"

														road_big_fav_losers += 1

													end

												end


											end


										end


									end


								else

									if s.choice == m.total_result

										total_winners += 1

									elsif s.choice != m.total_result && m.total_result != "push"

										total_losers += 1

									end

									if m.total.to_f <= 210

										if s.choice == m.total_result

											low_total_winners += 1

										elsif s.choice != m.total_result && m.total_result != "push"

											low_total_losers += 1

										end


									elsif m.total.to_f >= 210.5 && m.total.to_f <= 219.5

										if s.choice == m.total_result

											mid_total_winners += 1

										elsif s.choice != m.total_result && m.total_result != "push"

											mid_total_losers += 1

										end

									else

										if s.choice == m.total_result

											big_total_winners += 1

										elsif s.choice != m.total_result && m.total_result != "push"

											big_total_losers += 1

										end

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
			user_obj[:all_record] = (total_winners + side_winners).to_s + " - " + (side_losers + total_losers).to_s 
			user_obj[:all_prcnt] = (((total_winners + side_winners ) / (side_losers + total_losers)).round(2)).to_s + "%" 
			user_obj[:all_selections] = total_winners + total_losers + side_losers + side_winners
			user_obj[:sides_rec] = side_winners.to_s + " - " + side_losers.to_s 
			user_obj[:sides_prcnt] = (side_winners.to_f / (side_winners.to_f + side_losers.to_f)).round(2) 
			user_obj[:sides_prcnt] = user_obj[:sides_prcnt].to_s + "%" 

			user_obj[:totals_prcnt] = (total_winners.to_f / (total_winners.to_f + total_losers.to_f)).round(2) 
			user_obj[:totals_prcnt] = user_obj[:totals_prcnt].to_s + "%"
			
			user_obj[:home_record] = home_winners.to_s + " - " + home_losers.to_s
			user_obj[:home_prcnt] = (home_winners.to_f / (home_winners.to_f + home_losers.to_f)).round(2)
			user_obj[:home_prcnt] = user_obj[:home_prcnt].to_s + "%"

			user_obj[:road_record] = road_winners.to_s + " - " + road_losers.to_s
			user_obj[:road_prcnt] = (road_winners.to_f / (road_winners.to_f + road_losers.to_f)).round(2)
			user_obj[:road_prcnt] = user_obj[:road_prcnt].to_s + "%"

			user_obj[:home_low_fav_record] = home_low_fav_winners.to_s + " - " + home_low_fav_losers.to_s
			user_obj[:home_low_fav_prcnt] = (home_low_fav_winners.to_f / (home_low_fav_winners.to_f + home_low_fav_losers.to_f)).round(2)
			user_obj[:home_low_fav_prcnt] = user_obj[:home_low_fav_prcnt].to_s + "%"

			user_obj[:home_mid_fav_record] = home_mid_fav_winners.to_s + " - " + home_mid_fav_losers.to_s
			user_obj[:home_mid_fav_prcnt] = (home_mid_fav_winners.to_f / (home_mid_fav_winners.to_f + home_mid_fav_losers.to_f)).round(2)
			user_obj[:home_mid_fav_prcnt] = user_obj[:home_mid_fav_prcnt].to_s + "%"

			user_obj[:home_big_fav_record] = home_big_fav_winners.to_s + " - " + home_big_fav_losers.to_s
			user_obj[:home_big_fav_prcnt] = (home_big_fav_winners.to_f / (home_big_fav_winners.to_f + home_big_fav_losers.to_f)).round(2)
			user_obj[:home_big_fav_prcnt] = user_obj[:home_big_fav_prcnt].to_s + "%"

			user_obj[:home_low_dog_record] = home_low_dog_winners.to_s + " - " + home_low_dog_losers.to_s
			user_obj[:home_low_dog_prcnt] = (home_low_dog_winners.to_f / (home_low_dog_winners.to_f + home_low_dog_losers.to_f)).round(2)
			user_obj[:home_low_dog_prcnt] = user_obj[:home_low_dog_prcnt].to_s + "%"

			user_obj[:home_mid_dog_record] = home_mid_dog_winners.to_s + " - " + home_mid_dog_losers.to_s
			user_obj[:home_mid_dog_prcnt] = (home_mid_dog_winners.to_f / (home_mid_dog_winners.to_f + home_mid_dog_losers.to_f)).round(2)
			user_obj[:home_mid_dog_prcnt] = user_obj[:home_mid_dog_prcnt].to_s + "%"

			user_obj[:home_big_dog_record] = home_big_dog_winners.to_s + " - " + home_big_fav_losers.to_s
			user_obj[:home_big_dog_prcnt] = (home_big_dog_winners.to_f / (home_big_dog_winners.to_f + home_big_dog_losers.to_f)).round(2)
			user_obj[:home_big_dog_prcnt] = user_obj[:home_big_dog_prcnt].to_s + "%"

			user_obj[:road_low_fav_record] = road_low_fav_winners.to_s + " - " + road_low_fav_losers.to_s
			user_obj[:road_low_fav_prcnt] = (road_low_fav_winners.to_f / (road_low_fav_winners.to_f + road_low_fav_losers.to_f)).round(2)
			user_obj[:road_low_fav_prcnt] = user_obj[:road_low_fav_prcnt].to_s + "%"

			user_obj[:road_mid_fav_record] = road_mid_fav_winners.to_s + " - " + road_mid_fav_losers.to_s
			user_obj[:road_mid_fav_prcnt] = (road_mid_fav_winners.to_f / (road_mid_fav_winners.to_f + road_mid_fav_losers.to_f)).round(2)
			user_obj[:road_mid_fav_prcnt] = user_obj[:road_mid_fav_prcnt].to_s + "%"

			user_obj[:road_big_fav_record] = road_big_fav_winners.to_s + " - " + road_big_fav_losers.to_s
			user_obj[:road_big_fav_prcnt] = (road_big_fav_winners.to_f / (road_big_fav_winners.to_f + road_big_fav_losers.to_f)).round(2)
			user_obj[:road_big_fav_prcnt] = user_obj[:road_big_fav_prcnt].to_s + "%"

			user_obj[:road_low_dog_record] = road_low_dog_winners.to_s + " - " + road_low_dog_losers.to_s
			user_obj[:road_low_dog_prcnt] = (road_low_dog_winners.to_f / (road_low_dog_winners.to_f + road_low_dog_losers.to_f)).round(2)
			user_obj[:road_low_dog_prcnt] = user_obj[:road_low_dog_prcnt].to_s + "%"

			user_obj[:road_mid_dog_record] = road_mid_dog_winners.to_s + " - " + road_mid_dog_losers.to_s
			user_obj[:road_mid_dog_prcnt] = (road_mid_dog_winners.to_f / (road_mid_dog_winners.to_f + road_mid_dog_losers.to_f)).round(2)
			user_obj[:road_mid_dog_prcnt] = user_obj[:road_mid_dog_prcnt].to_s + "%"

			user_obj[:road_big_dog_record] = road_big_dog_winners.to_s + " - " + road_big_fav_losers.to_s
			user_obj[:road_big_dog_prcnt] = (road_big_dog_winners.to_f / (road_big_dog_winners.to_f + road_big_dog_losers.to_f)).round(2)
			user_obj[:road_big_dog_prcnt] = user_obj[:road_big_dog_prcnt].to_s + "%"

			user_obj[:low_spread_record] = low_spread_winners.to_s + " - " + low_spread_losers.to_s
			user_obj[:low_spread_prcnt] = (low_spread_winners.to_f / (low_spread_losers.to_f + low_spread_winners.to_f)).round(2)
			user_obj[:low_spread_prcnt] = user_obj[:low_spread_prcnt].to_s + "%"

			user_obj[:mid_spread_record] = mid_spread_winners.to_s + " - " + mid_spread_losers.to_s
			user_obj[:mid_spread_prcnt] = (mid_spread_winners.to_f / (mid_spread_losers.to_f + mid_spread_winners.to_f)).round(2)
			user_obj[:mid_spread_prcnt] = user_obj[:mid_spread_prcnt].to_s + "%"

			user_obj[:big_spread_record] = big_spread_winners.to_s + " - " + big_spread_losers.to_s
			user_obj[:big_spread_prcnt] = (big_spread_winners.to_f / (big_spread_losers.to_f + big_spread_winners.to_f)).round(2)
			user_obj[:big_spread_prcnt] = user_obj[:big_spread_prcnt].to_s + "%"

			user_obj[:low_total_record] = low_total_winners.to_s + " - " + low_total_losers.to_s
			user_obj[:low_total_prcnt] = (low_total_winners.to_f / (low_total_losers.to_f + low_total_winners.to_f)).round(2)
			user_obj[:low_total_prcnt] = user_obj[:low_total_prcnt].to_s + "%"

			user_obj[:mid_total_record] = mid_total_winners.to_s + " - " + mid_total_losers.to_s
			user_obj[:mid_total_prcnt] = (mid_total_winners.to_f / (mid_total_losers.to_f + mid_total_winners.to_f)).round(2)
			user_obj[:mid_total_prcnt] = user_obj[:mid_total_prcnt].to_s + "%"

			user_obj[:big_total_record] = big_total_winners.to_s + " - " + big_total_losers.to_s
			user_obj[:big_total_prcnt] = (big_total_winners.to_f / (big_total_losers.to_f + big_total_winners.to_f)).round(2)
			user_obj[:big_total_prcnt] = user_obj[:big_total_prcnt].to_s + "%"

			@all_nba.push(user_obj) 

		end

	end

	def pull_stats (stats, sport, situation)

		@stat_holder = []
		num_holder = []

		if sport == "NFL"

			if situation == "ALL"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:all_record]
					info[:all_prcnt] = n[:all_prcnt]

					num_holder.push(n[:all_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse


				num_holder.each do |num|

					stats.each do |s|

						if num.to_f == s[:all_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:username] = username
							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:stat] = s[:all_prcnt]
							ordered_stat[:rec] = s[:all_record]

							

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end

			elsif situation == "HOME"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_record]
					info[:all_prcnt] = n[:home_prcnt]

					num_holder.push(n[:home_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:username] = username
							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:stat] = s[:home_prcnt]
							ordered_stat[:rec] = s[:home_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_record]
					info[:all_prcnt] = n[:road_prcnt]

					num_holder.push(n[:road_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_prcnt]
							ordered_stat[:rec] = s[:road_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "LOW SPREAD"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:low_spread_record]
					info[:all_prcnt] = n[:low_spread_prcnt]

					num_holder.push(n[:low_spread_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:low_spread_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:low_spread_prcnt]
							ordered_stat[:rec] = s[:low_spread_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "MID SPREAD"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:mid_spread_record]
					info[:all_prcnt] = n[:mid_spread_prcnt]

					num_holder.push(n[:mid_spread_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:mid_spread_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:mid_spread_prcnt]
							ordered_stat[:rec] = s[:mid_spread_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "BIG SPREAD"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:big_spread_record]
					info[:all_prcnt] = n[:big_spread_prcnt]

					num_holder.push(n[:big_spread_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:big_spread_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:big_spread_prcnt]
							ordered_stat[:rec] = s[:big_spread_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME SMALL FAV"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_low_fav_record]
					info[:all_prcnt] = n[:home_low_fav_prcnt]

					num_holder.push(n[:home_low_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_low_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_low_fav_prcnt]
							ordered_stat[:rec] = s[:home_low_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME MID FAV"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_mid_fav_record]
					info[:all_prcnt] = n[:home_mid_fav_prcnt]

					num_holder.push(n[:home_mid_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_mid_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_mid_fav_prcnt]
							ordered_stat[:rec] = s[:home_mid_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME BIG FAV"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_big_fav_record]
					info[:all_prcnt] = n[:home_big_fav_prcnt]

					num_holder.push(n[:home_big_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_big_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_big_fav_prcnt]
							ordered_stat[:rec] = s[:home_big_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME BIG DOG"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_big_dog_record]
					info[:all_prcnt] = n[:home_big_dog_prcnt]

					num_holder.push(n[:home_big_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_big_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_big_dog_prcnt]
							ordered_stat[:rec] = s[:home_big_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME MID DOG"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_mid_dog_record]
					info[:all_prcnt] = n[:home_mid_dog_prcnt]

					num_holder.push(n[:home_mid_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_mid_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_mid_dog_prcnt]
							ordered_stat[:rec] = s[:home_mid_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME SMALL DOG"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_low_dog_record]
					info[:all_prcnt] = n[:home_low_dog_prcnt]

					num_holder.push(n[:home_low_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_low_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_low_dog_prcnt]
							ordered_stat[:rec] = s[:home_low_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end

			elsif situation == "ROAD SMALL FAV"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_low_fav_record]
					info[:all_prcnt] = n[:road_low_fav_prcnt]

					num_holder.push(n[:road_low_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_low_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_low_fav_prcnt]
							ordered_stat[:rec] = s[:road_low_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD MID FAV"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_mid_fav_record]
					info[:all_prcnt] = n[:road_mid_fav_prcnt]

					num_holder.push(n[:road_mid_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_mid_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_mid_fav_prcnt]
							ordered_stat[:rec] = s[:road_mid_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD BIG FAV"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_big_fav_record]
					info[:all_prcnt] = n[:road_big_fav_prcnt]

					num_holder.push(n[:road_big_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_big_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_big_fav_prcnt]
							ordered_stat[:rec] = s[:road_big_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD BIG DOG"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_big_dog_record]
					info[:all_prcnt] = n[:road_big_dog_prcnt]

					num_holder.push(n[:road_big_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_big_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_big_dog_prcnt]
							ordered_stat[:rec] = s[:road_big_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD MID DOG"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_mid_dog_record]
					info[:all_prcnt] = n[:road_mid_dog_prcnt]

					num_holder.push(n[:road_mid_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_mid_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_mid_dog_prcnt]
							ordered_stat[:rec] = s[:road_mid_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD SMALL DOG"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_low_dog_record]
					info[:all_prcnt] = n[:road_low_dog_prcnt]

					num_holder.push(n[:road_low_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_low_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_low_dog_prcnt]
							ordered_stat[:rec] = s[:road_low_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "LOW TOTALS"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:low_total_record]
					info[:all_prcnt] = n[:low_total_prcnt]

					num_holder.push(n[:low_total_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:low_total_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:low_total_prcnt]
							ordered_stat[:rec] = s[:low_total_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "MID TOTALS"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:mid_total_record]
					info[:all_prcnt] = n[:mid_total_prcnt]

					num_holder.push(n[:mid_total_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:mid_total_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:mid_total_prcnt]
							ordered_stat[:rec] = s[:mid_total_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HIGH TOTALS"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:big_total_record]
					info[:all_prcnt] = n[:big_total_prcnt]

					num_holder.push(n[:big_total_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:big_total_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:big_total_prcnt]
							ordered_stat[:rec] = s[:big_total_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ALL TOTALS"

				@all_nfl.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:total_rec]
					info[:all_prcnt] = n[:totals_prcnt]

					num_holder.push(n[:totals_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:totals_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:totals_prcnt]
							ordered_stat[:rec] = s[:total_rec]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end

			end


		elsif sport == "NBA"

			if situation == "ALL"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:all_record]
					info[:all_prcnt] = n[:all_prcnt]

					num_holder.push(n[:all_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:all_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:all_prcnt]
							ordered_stat[:rec] = s[:all_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end

			elsif situation == "HOME"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_record]
					info[:all_prcnt] = n[:home_prcnt]

					num_holder.push(n[:home_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_prcnt]
							ordered_stat[:rec] = s[:home_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_record]
					info[:all_prcnt] = n[:road_prcnt]

					num_holder.push(n[:road_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_prcnt]
							ordered_stat[:rec] = s[:road_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "LOW SPREAD"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:low_spread_record]
					info[:all_prcnt] = n[:low_spread_prcnt]

					num_holder.push(n[:low_spread_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:low_spread_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:low_spread_prcnt]
							ordered_stat[:rec] = s[:low_spread_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "MID SPREAD"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:mid_spread_record]
					info[:all_prcnt] = n[:mid_spread_prcnt]

					num_holder.push(n[:mid_spread_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:mid_spread_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:mid_spread_prcnt]
							ordered_stat[:rec] = s[:mid_spread_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "BIG SPREAD"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:big_spread_record]
					info[:all_prcnt] = n[:big_spread_prcnt]

					num_holder.push(n[:big_spread_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:big_spread_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:big_spread_prcnt]
							ordered_stat[:rec] = s[:big_spread_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME SMALL FAV"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_low_fav_record]
					info[:all_prcnt] = n[:home_low_fav_prcnt]

					num_holder.push(n[:home_low_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_low_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_low_fav_prcnt]
							ordered_stat[:rec] = s[:home_low_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME MID FAV"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_mid_fav_record]
					info[:all_prcnt] = n[:home_mid_fav_prcnt]

					num_holder.push(n[:home_mid_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_mid_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_mid_fav_prcnt]
							ordered_stat[:rec] = s[:home_mid_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME BIG FAV"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_big_fav_record]
					info[:all_prcnt] = n[:home_big_fav_prcnt]

					num_holder.push(n[:home_big_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_big_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_big_fav_prcnt]
							ordered_stat[:rec] = s[:home_big_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME BIG DOG"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_big_dog_record]
					info[:all_prcnt] = n[:home_big_dog_prcnt]

					num_holder.push(n[:home_big_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_big_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_big_dog_prcnt]
							ordered_stat[:rec] = s[:home_big_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME MID DOG"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_mid_dog_record]
					info[:all_prcnt] = n[:home_mid_dog_prcnt]

					num_holder.push(n[:home_mid_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_mid_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_mid_dog_prcnt]
							ordered_stat[:rec] = s[:home_mid_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HOME SMALL DOG"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:home_low_dog_record]
					info[:all_prcnt] = n[:home_low_dog_prcnt]

					num_holder.push(n[:home_low_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:home_low_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:home_low_dog_prcnt]
							ordered_stat[:rec] = s[:home_low_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end

			elsif situation == "ROAD SMALL FAV"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_low_fav_record]
					info[:all_prcnt] = n[:road_low_fav_prcnt]

					num_holder.push(n[:road_low_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_low_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_low_fav_prcnt]
							ordered_stat[:rec] = s[:road_low_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD MID FAV"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_mid_fav_record]
					info[:all_prcnt] = n[:road_mid_fav_prcnt]

					num_holder.push(n[:road_mid_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_mid_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_mid_fav_prcnt]
							ordered_stat[:rec] = s[:road_mid_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD BIG FAV"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_big_fav_record]
					info[:all_prcnt] = n[:road_big_fav_prcnt]

					num_holder.push(n[:road_big_fav_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_big_fav_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_big_fav_prcnt]
							ordered_stat[:rec] = s[:road_big_fav_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD BIG DOG"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_big_dog_record]
					info[:all_prcnt] = n[:road_big_dog_prcnt]

					num_holder.push(n[:road_big_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_big_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_big_dog_prcnt]
							ordered_stat[:rec] = s[:road_big_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD MID DOG"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_mid_dog_record]
					info[:all_prcnt] = n[:road_mid_dog_prcnt]

					num_holder.push(n[:road_mid_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_mid_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_mid_dog_prcnt]
							ordered_stat[:rec] = s[:road_mid_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ROAD SMALL DOG"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:road_low_dog_record]
					info[:all_prcnt] = n[:road_low_dog_prcnt]

					num_holder.push(n[:road_low_dog_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:road_low_dog_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:road_low_dog_prcnt]
							ordered_stat[:rec] = s[:road_low_dog_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "LOW TOTALS"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:low_total_record]
					info[:all_prcnt] = n[:low_total_prcnt]

					num_holder.push(n[:low_total_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:low_total_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:low_total_prcnt]
							ordered_stat[:rec] = s[:low_total_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "MID TOTALS"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:mid_total_record]
					info[:all_prcnt] = n[:mid_total_prcnt]

					num_holder.push(n[:mid_total_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:mid_total_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:mid_total_prcnt]
							ordered_stat[:rec] = s[:mid_total_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "HIGH TOTALS"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:big_total_record]
					info[:all_prcnt] = n[:big_total_prcnt]

					num_holder.push(n[:big_total_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:big_total_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:big_total_prcnt]
							ordered_stat[:rec] = s[:big_total_record]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end
			
			elsif situation == "ALL TOTALS"

				@all_nba.each do |n|

					info = Hash.new

					info[:user_id] = n[:user_id]
					info[:all_rec] = n[:total_rec]
					info[:all_prcnt] = n[:totals_prcnt]

					num_holder.push(n[:totals_prcnt].to_f)

				end

				num_holder = num_holder.sort
				num_holder = num_holder.reverse

				num_holder.each do |num|

					stats.each do |s|

						if num == s[:totals_prcnt].to_f

							username = " "

							User.all.each do |u|

								if u.id == s[:user_id].to_i

									username = u.username

								end

							end

							ordered_stat = Hash.new

							ordered_stat[:user_id] = s[:user_id]
							ordered_stat[:username] = username
							ordered_stat[:stat] = s[:totals_prcnt]
							ordered_stat[:rec] = s[:total_rec]

							@stat_holder.push(ordered_stat) unless @stat_holder.include?(ordered_stat)

						end

					end


				end

			end

		end


	end

end
