defmodule ExMonAPI.Repo do
  use Ecto.Repo,
    otp_app: :ex_monAPI,
    adapter: Ecto.Adapters.Postgres
end
