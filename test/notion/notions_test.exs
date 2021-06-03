defmodule Notion.NotionsTest do
  use Notion.DataCase

  alias Notion.Notions

  describe "tasks" do
    alias Notion.Notions.Task

    @valid_attrs %{completed: true, date: ~D[2010-04-17], deadline: ~D[2010-04-17], notes: "some notes", title: "some title"}
    @update_attrs %{completed: false, date: ~D[2011-05-18], deadline: ~D[2011-05-18], notes: "some updated notes", title: "some updated title"}
    @invalid_attrs %{completed: nil, date: nil, deadline: nil, notes: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Notions.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Notions.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Notions.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Notions.create_task(@valid_attrs)
      assert task.completed == true
      assert task.date == ~D[2010-04-17]
      assert task.deadline == ~D[2010-04-17]
      assert task.notes == "some notes"
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notions.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Notions.update_task(task, @update_attrs)
      assert task.completed == false
      assert task.date == ~D[2011-05-18]
      assert task.deadline == ~D[2011-05-18]
      assert task.notes == "some updated notes"
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Notions.update_task(task, @invalid_attrs)
      assert task == Notions.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Notions.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Notions.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Notions.change_task(task)
    end
  end
end
