import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :miniproject01, Miniproject01.Repo,
  username: "postgres",
  password: "postgres",
  database: "miniproject01_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :miniproject01, Miniproject01Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zOE8H3S5xmhKljlWbydnSeOH+VAkvhb0styf8tN01vMGI5sKXIurM9uq1T+kXcjW",
  server: false

# In test we don't send emails.
config :miniproject01, Miniproject01.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
