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
end
