class DeleteUserIdColumn < ActiveRecord::Migration[6.1]
  def up
    remove_column :restaurants, :user_id
  end
  def down
    add_column :restaurants, :user_id, :integer
  end
end
