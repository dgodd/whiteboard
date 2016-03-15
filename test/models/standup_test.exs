defmodule Whiteboard.StandupTest do
  use Whiteboard.ModelCase

  alias Whiteboard.Standup

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Standup.changeset(%Standup{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Standup.changeset(%Standup{}, @invalid_attrs)
    refute changeset.valid?
  end
end
