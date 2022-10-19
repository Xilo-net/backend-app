class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :question, null: false
      t.string :answers, array: true, default: []
      t.integer :points, null: false, default: 0
      t.timestamps
    end
  end
end
