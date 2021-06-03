# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :notion,
  ecto_repos: [Notion.Repo]

# Configures the endpoint
config :notion, NotionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r/X89bryJVehD8gZkCgDLT5BOWgOw/7B3nHkQCABEgd34cP09OT7RZzwAAZglfDm",
  render_errors: [view: NotionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Notion.PubSub,
  live_view: [signing_salt: "zbawp23/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
