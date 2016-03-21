# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :whiteboard, Whiteboard.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "DgQPBjyZlG8AZ4DC+XNnuUw0lVzEsrjvE4653215Q1T2DcEkY+PCKQhBcxA+8YyJ",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Whiteboard.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Start Hound for ChromeDriver (default port 9515 assumed)
config :hound, driver: "chrome_driver"