defmodule Miniproject01.Repo do
  use Ecto.Repo,
    otp_app: :miniproject01,
    adapter: Ecto.Adapters.Postgres
end
