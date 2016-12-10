class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.string :name
      t.references :garden, foreign_key: true

      t.timestamps
    end
  end
end
