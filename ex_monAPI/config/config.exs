# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_monAPI,
  ecto_repos: [ExMonAPI.Repo]

# Configures the endpoint
config :ex_monAPI, ExMonAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B114UCq4mJNO7Av3UKJEx2OGsjIEoUwvv0hyE47ZfXABsT4Lyn6eIRFSJB2nT8Hx",
  render_errors: [view: ExMonAPIWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExMonAPI.PubSub,
  live_view: [signing_salt: "OpLVGi9V"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
