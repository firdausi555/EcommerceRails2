class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :string, default: 'buyer'
    add_index :users, :role
  end
end
