class AddFoodIdToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :id, :integer
  end
end
