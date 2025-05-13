class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :due_at
      t.string :category
      t.boolean :auto_remind
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
