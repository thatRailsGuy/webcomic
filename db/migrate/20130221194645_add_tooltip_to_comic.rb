class AddTooltipToComic < ActiveRecord::Migration
  def self.up
    add_column :comics, :tooltip, :string
  end
  def self.down
   remove_column :comics, :tooltip
  end
end
