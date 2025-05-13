require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "index returns all tasks" do
    get tasks_url(format: :json)
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal Task.count, body.length
  end

  test "show returns a single task" do
    task = Task.first
    get task_url(task, format: :json)
    assert_response :success
    data = JSON.parse(response.body)
    assert_equal task.title, data["title"]
  end

  test "create adds a task" do
    user = users(:one)
    assert_difference "Task.count", 1 do
      post tasks_url(format: :json), params: {
        title: "New Task",
        due_at: 1.day.from_now,
        category: "testing",
        auto_remind: true,
        user_id: user.id
      }
    end
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal "New Task", body["title"]
  end

  test "update edits a task" do
    task = tasks(:one)
    patch task_url(task, format: :json), params: { title: "Updated" }
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal "Updated", body["title"]
  end

  test "destroy removes a task" do
    task = tasks(:one)
    assert_difference "Task.count", -1 do
      delete task_url(task, format: :json)
    end
    assert_response :no_content
  end
end
