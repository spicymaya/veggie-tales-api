class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :region
      t.string :type
      t.integer :rating
      t.string :image_url

      t.timestamps
    end
  end
end
