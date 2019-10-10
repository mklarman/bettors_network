class CreateSecrets < ActiveRecord::Migration[5.1]
  def change
    create_table :secrets do |t|

    	t.integer :user_id
    	t.string :target
    	t.string :content
    	t.string :date

      t.timestamps
    end
  end
end
