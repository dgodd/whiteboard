defmodule Whiteboard.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :title, :string
      add :author, :string
      add :date, :date
      add :description, :string
      add :standup_id, references(:standups, on_delete: :nothing)

      timestamps
    end
    create index(:items, [:standup_id])

  end
end
