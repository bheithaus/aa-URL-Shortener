class AddLongUrlToLink < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.integer :long_url_id
    end
  end
end
