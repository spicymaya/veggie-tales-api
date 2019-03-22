class RemoveCreatedBy < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :created_by
  end
end
