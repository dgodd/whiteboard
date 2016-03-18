defmodule Whiteboard.Repo.Migrations.CreateKind do
  use Ecto.Migration

  def change do
    create table(:kinds) do
      add :name, :string

      timestamps
    end

    alter table(:items) do
      add :kind_id, references(:kinds, on_delete: :nothing)
    end
  end
end
