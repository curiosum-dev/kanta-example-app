defmodule KantaTest.Repo do
  use Ecto.Repo,
    otp_app: :kanta_test,
    adapter: Ecto.Adapters.Postgres
end
