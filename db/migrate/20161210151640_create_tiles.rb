class CreateTiles < ActiveRecord::Migration[5.0]
  def change
    create_table :tiles do |t|
      t.string :type
      t.references :design, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
