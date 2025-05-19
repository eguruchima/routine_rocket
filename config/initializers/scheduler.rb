require "rufus-scheduler"

scheduler = Rufus::Scheduler.singleton

scheduler.every "1m" do
  now = Time.current

  Task.where(auto_remind: true)
      .where("due_at <= ?", now)
      .find_each do |task|
    Rails.logger.info "⏰ [Scheduler] Task ##{task.id} is due: #{task.title}"

    task.update!(auto_remind: false, reminder_sent: true)
  end
end
