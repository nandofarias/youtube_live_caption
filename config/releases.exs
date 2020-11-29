import Config

config :youtube_live_caption, YoutubeLiveCaptionWeb.Endpoint,
  url: [host: System.fetch_env!("ENDPOINT_HOST"), port: 443],
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE")
