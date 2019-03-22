class ChangeCreatedBy < ActiveRecord::Migration[5.2]
  def up
    change_table :foods do |t|
      add_column :foods, :user_id, :integer
    end
  end
 
  def down

      add_column :foods, :created_by, :string

  end
end
