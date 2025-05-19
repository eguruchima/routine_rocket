json.extract! task,
  :id,
  :title,
  :due_at,
  :category,
  :auto_remind,
  :user_id,
  :created_at,
  :updated_at

json.reminder_sent task.reminder_sent

json.url task_url(task, format: :json)
