defmodule Whiteboard.ItemControllerTest do
  use Whiteboard.ConnCase

  alias Whiteboard.Item
  @valid_attrs %{author: "some content", date: "2010-04-17", description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, standup_item_path(conn, :index, 1)
    assert html_response(conn, 200) =~ "Listing items"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, standup_item_path(conn, :new, 1)
    assert html_response(conn, 200) =~ "New item"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, standup_item_path(conn, :create, 1), item: @valid_attrs
    assert redirected_to(conn) == standup_item_path(conn, :index, 1)
    assert Repo.get_by(Item, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, standup_item_path(conn, :create, 1), item: @invalid_attrs, standup: %{}, kinds: []
    assert html_response(conn, 200) =~ "New item"
  end

  test "shows chosen resource", %{conn: conn} do
    item = Repo.insert! %Item{}
    conn = get conn, standup_item_path(conn, :show, 1, item)
    assert html_response(conn, 200) =~ "Show item"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, standup_item_path(conn, :show, 1, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    item = Repo.insert! %Item{}
    conn = get conn, standup_item_path(conn, :edit, 1, item)
    assert html_response(conn, 200) =~ "Edit item"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    item = Repo.insert! %Item{}
    conn = put conn, standup_item_path(conn, :update, 1, item), item: @valid_attrs
    assert redirected_to(conn) == standup_item_path(conn, :show, 1, item)
    assert Repo.get_by(Item, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    item = Repo.insert! %Item{}
    conn = put conn, standup_item_path(conn, :update, 1, item), item: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit item"
  end

  test "deletes chosen resource", %{conn: conn} do
    item = Repo.insert! %Item{}
    conn = delete conn, standup_item_path(conn, :delete, 1, item)
    assert redirected_to(conn) == standup_item_path(conn, :index, 1)
    refute Repo.get(Item, item.id)
  end
end
