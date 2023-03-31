import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :kanta_test, KantaTest.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "kanta_test_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kanta_test, KantaTestWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "0NPTW00t8etrP+IRi3XFlHIZxEG3JxZXUfn7XBCEvSBeI2PJPTWklTqF8mvfQDtZ",
  server: false

# In test we don't send emails.
config :kanta_test, KantaTest.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
