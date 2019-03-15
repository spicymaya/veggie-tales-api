class AddCreatedByColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :created_by, :string
  end
end
