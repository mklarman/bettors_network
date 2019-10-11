class CreateSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :selections do |t|

      t.integer :user_id
      t.integer :matchup_id
      t.string :cat
      t.string :choice

      t.timestamps
    end
  end
end
