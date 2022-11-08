class RenameAdminAttrbt < ActiveRecord::Migration[7.0]
  def change
    rename_column :group_users, :admin, :group_admin
  end
end
