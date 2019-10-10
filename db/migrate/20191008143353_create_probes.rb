class CreateProbes < ActiveRecord::Migration[5.1]
  def change
    create_table :probes do |t|

    	t.integer :user_id
    	t.integer :matchup_id
    	t.string :research


      t.timestamps
    end
  end
end
