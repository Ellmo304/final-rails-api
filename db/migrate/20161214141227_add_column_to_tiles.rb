class AddColumnToTiles < ActiveRecord::Migration[5.0]
  def change
    add_column :tiles, :image, :string
  end
end
