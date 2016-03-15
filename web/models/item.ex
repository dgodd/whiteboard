defmodule Whiteboard.Item do
  use Whiteboard.Web, :model

  schema "items" do
    field :title, :string
    field :author, :string
    field :date, Ecto.Date
    field :description, :string
    belongs_to :standup, Whiteboard.Standup

    timestamps
  end

  @required_fields ~w(title author date description)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
