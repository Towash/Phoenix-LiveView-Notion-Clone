defmodule Notion.Repo do
  use Ecto.Repo,
    otp_app: :notion,
    adapter: Ecto.Adapters.Postgres
end
