# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :youtube_live_caption, YoutubeLiveCaptionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FVeyj3N2tQrICy84anUctOZT4zgKY2vr1ADFXM/us6F+j7XwRoJn0u6ZpboFi1fb",
  render_errors: [view: YoutubeLiveCaptionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: YoutubeLiveCaption.PubSub,
  live_view: [signing_salt: "Wlh5J+jS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
