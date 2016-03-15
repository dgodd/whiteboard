defmodule Whiteboard.ItemTest do
  use Whiteboard.ModelCase

  alias Whiteboard.Item

  @valid_attrs %{author: "some content", date: "2010-04-17", description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end
