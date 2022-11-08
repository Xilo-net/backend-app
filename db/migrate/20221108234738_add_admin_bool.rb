class AddAdminBool < ActiveRecord::Migration[7.0]
  def change
    add_column :group_users, :admin, :boolean, default: false
  end
end
