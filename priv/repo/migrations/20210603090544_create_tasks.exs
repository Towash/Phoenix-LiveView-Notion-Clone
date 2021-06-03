defmodule Notion.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :date, :date
      add :deadline, :date
      add :completed, :boolean, default: false, null: false
      add :notes, :string

      timestamps()
    end

  end
end
