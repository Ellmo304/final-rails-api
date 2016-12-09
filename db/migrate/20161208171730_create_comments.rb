class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :garden, foreign_key: true
      t.date :date
      t.integer :rating

      t.timestamps
    end
  end
end
