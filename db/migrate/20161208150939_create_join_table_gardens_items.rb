class CreateJoinTableGardensItems < ActiveRecord::Migration[5.0]
  def change
    create_join_table :gardens, :items do |t|
      t.index [:garden_id, :item_id]
      t.index [:item_id, :garden_id]
    end
  end
end
