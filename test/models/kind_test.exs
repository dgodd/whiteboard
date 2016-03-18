defmodule Whiteboard.KindTest do
  use Whiteboard.ModelCase

  alias Whiteboard.Kind

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Kind.changeset(%Kind{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Kind.changeset(%Kind{}, @invalid_attrs)
    refute changeset.valid?
  end
end
