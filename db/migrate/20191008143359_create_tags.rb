class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|

    	t.integer :user_id
    	t.string :tagged
    	t.string :sport
    	t.string :situation
    	t.string :date
    	t.string :cat 
    	
      t.timestamps
    end
  end
end
