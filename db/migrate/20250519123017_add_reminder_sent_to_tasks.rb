class AddReminderSentToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :reminder_sent, :boolean
  end
end
