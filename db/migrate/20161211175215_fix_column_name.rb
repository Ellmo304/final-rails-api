class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :tiles, :type, :class_type
  end
end
