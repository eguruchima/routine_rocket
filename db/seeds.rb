User.destroy_all
Task.destroy_all

alice = User.create!(
  name: "Alice Example",
  email: "alice@example.com",
  password: "password",
  image_url: "https://via.placeholder.com/100"
)

bob = User.create!(
  name: "Bob Example",
  email: "bob@example.com",
  password: "password",
  image_url: "https://via.placeholder.com/100"
)

Task.create!(
  title: "Pay electricity bill",
  due_at: 2.day.from_now,
  category: "bills",
  auto_remind: true,
  user: alice
)

Task.create!(
  title: "Doctor appointment",
  due_at: 4.days.from_now,
  category: "appointments",
  auto_remind: false,
  user: bob
)
