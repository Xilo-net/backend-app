class CreateGroupResources < ActiveRecord::Migration[7.0]
  def change
    create_table :group_resources, id: :uuid do |t|
      t.references :group, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false, unique: true
      t.string :category, null: false
      t.timestamps
    end
  end
end
