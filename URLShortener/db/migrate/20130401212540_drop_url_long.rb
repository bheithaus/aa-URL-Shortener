class DropUrlLong < ActiveRecord::Migration
  def up
    remove_column :links, :url_long
  end
end
