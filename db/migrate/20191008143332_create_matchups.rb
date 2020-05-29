class CreateMatchups < ActiveRecord::Migration[5.1]
  def change
    create_table :matchups do |t|

	  t.string :sport
	  t.string :date
	  t.string :fav
	  t.string :dog
	  t.boolean :fav_home
	  t.string :spread
	  t.string :money_line
	  t.string :dog_ml
	  t.string :total
	  t.string :start_time
	  t.boolean :show_game, default: true
	  t.string :fav_score
	  t.string :dog_score
	  t.string :ats_winner
	  t.string :total_result

      t.timestamps
    end
  end
end
