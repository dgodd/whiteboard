defmodule Whiteboard.ItemController do
  use Whiteboard.Web, :controller

  alias Whiteboard.Item
  alias Whiteboard.Kind

  plug :scrub_params, "item" when action in [:create, :update]

  def index(conn, %{"standup_id"=>standup_id}) do
    standup = Repo.get!(Whiteboard.Standup, standup_id)
    items = Repo.all from(k in Item, order_by: k.id, where: k.standup_id == ^standup_id)
    items = Repo.preload items, [:kind]

    render(conn, "index.html", standup: standup, items: items)
  end

  def new(conn, %{"standup_id"=>standup_id}) do
    standup = Repo.get!(Whiteboard.Standup, standup_id)
    kinds = Repo.all from(k in Kind, order_by: k.id, select: {k.name, k.id})

    changeset = Item.changeset(%Item{})
    render(conn, "new.html", standup: standup, kinds: kinds, changeset: changeset)
  end

  def create(conn, %{"item" => item_params, "standup_id"=>standup_id}) do
    standup = Repo.get!(Whiteboard.Standup, standup_id)
    kinds = Repo.all from(k in Kind, order_by: k.id, select: {k.name, k.id})
    changeset = Item.changeset(%Item{standup_id: standup.id}, item_params)

    case Repo.insert(changeset) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: standup_item_path(conn, :index, standup_id))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset, kinds: kinds, standup: standup)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Repo.get!(Item, id)
    item = Repo.preload item, [:standup,:kind]

    render(conn, "show.html", item: item)
  end

  def edit(conn, %{"id" => id}) do
    item = Repo.get!(Item, id)
    kinds = Repo.all from(k in Kind, order_by: k.id, select: {k.name, k.id})

    changeset = Item.changeset(item)
    render(conn, "edit.html", item: item, kinds: kinds, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Repo.get!(Item, id)
    kinds = Repo.all from(k in Kind, order_by: k.id, select: {k.name, k.id})
    changeset = Item.changeset(item, item_params)

    case Repo.update(changeset) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: standup_item_path(conn, :show, 1, item))
      {:error, changeset} ->
        render(conn, "edit.html", item: item, kinds: kinds, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Repo.get!(Item, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: standup_item_path(conn, :index, 1))
  end
end
