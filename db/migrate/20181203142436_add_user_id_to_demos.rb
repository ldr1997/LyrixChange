class AddUserIdToDemos < ActiveRecord::Migration[5.2]
  def change
    add_column :demos, :user_id, :integer
  end
end
