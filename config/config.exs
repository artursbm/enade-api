# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :enade_api,
  namespace: EnadeAPI,
  ecto_repos: [EnadeAPI.Repo]

# Configures the endpoint
config :enade_api, EnadeAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3ZNOV6KLGwf0Yk73VhXfuUQU7YRZ39CO0abCkpDX6+2sLSoYI76q30Mc+28P/bmU",
  render_errors: [view: EnadeAPIWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: EnadeAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
