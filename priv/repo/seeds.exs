# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Whiteboard.Repo.insert!(%Whiteboard.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Whiteboard.Repo.insert!(%Whiteboard.Kind{name: "New Faces"})
Whiteboard.Repo.insert!(%Whiteboard.Kind{name: "Helps"})
Whiteboard.Repo.insert!(%Whiteboard.Kind{name: "Interestings"})
Whiteboard.Repo.insert!(%Whiteboard.Kind{name: "Events"})
