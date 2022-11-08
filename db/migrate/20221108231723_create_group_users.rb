class CreateGroupUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :group_users, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :group, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
