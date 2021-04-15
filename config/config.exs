# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Configure Mix tasks and generators
config :speedrun,
  ecto_repos: [Speedrun.Repo]

config :speedrun_web,
  ecto_repos: [Speedrun.Repo],
  generators: [context_app: :speedrun, binary_id: true]

# Configures the endpoint
config :speedrun_web, SpeedrunWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xFV2HImHeMe/vbM7FaaNDexqWjQOMTLRjWgSA+AGNdKpUL3PSFj75IVDxWQHW+0G",
  render_errors: [view: SpeedrunWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Speedrun.PubSub,
  live_view: [signing_salt: "DYYOaU8E"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
