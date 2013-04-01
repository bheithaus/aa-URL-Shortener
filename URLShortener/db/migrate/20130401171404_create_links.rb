class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url_long
      t.string :url_short
      t.integer :user_id

      t.timestamps
    end
  end
end
