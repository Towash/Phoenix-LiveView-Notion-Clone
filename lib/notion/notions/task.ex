defmodule Notion.Notions.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed, :boolean, default: false
    field :date, :date
    field :deadline, :date
    field :notes, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :date, :deadline, :completed, :notes])
    |> validate_required([:title, :date, :deadline, :completed, :notes])
  end
end
