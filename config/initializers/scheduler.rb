require "rufus-scheduler"

scheduler = Rufus::Scheduler.singleton

scheduler.every "1m" do
  now = Time.current

  Task.where(auto_remind: true)
      .where("due_at <= ?", now)
      .find_each do |task|
    TWILIO_CLIENT.messages.create(
      from: TWILIO_FROM_NUMBER,
      to:   REMINDER_TO_NUMBER,
      body: "⏰ Reminder: “#{task.title}” is now due!"
    )

    task.update!(auto_remind: false, reminder_sent: true)

    Rails.logger.info "✅ [Scheduler] SMS sent for Task ##{task.id}: #{task.title}"
  end
end
