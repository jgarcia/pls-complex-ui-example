defmodule ExJournoNoSchema.Repo do
  use Ecto.Repo,
    otp_app: :ex_journo_no_schema,
    adapter: Ecto.Adapters.SQLite3
end
