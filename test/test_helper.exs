ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Whiteboard.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Whiteboard.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Whiteboard.Repo)

