class AddColumnToGardens < ActiveRecord::Migration[5.0]
  def change
    add_column :gardens, :likes, :string, array: true, default: []
  end
end
