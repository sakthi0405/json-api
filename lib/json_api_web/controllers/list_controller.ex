defmodule JsonApiWeb.ListController do
  use JsonApiWeb, :controller

  alias JsonApi.Product
  alias JsonApi.Product.List

  action_fallback JsonApiWeb.FallbackController

  def index(conn, _params) do
    list = Product.list_list()
    render(conn, :index, list: list)
  end

  def create(conn, %{"list" => list_params}) do
    with {:ok, %List{} = list} <- Product.create_list(list_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/list/#{list}")
      |> render(:show, list: list)
    end
  end

  def show(conn, %{"id" => id}) do
    list = Product.get_list!(id)
    render(conn, :show, list: list)
  end

  def update(conn, %{"id" => id, "list" => list_params}) do
    list = Product.get_list!(id)

    with {:ok, %List{} = list} <- Product.update_list(list, list_params) do
      render(conn, :show, list: list)
    end
  end

  def delete(conn, %{"id" => id}) do
    list = Product.get_list!(id)

    with {:ok, %List{}} <- Product.delete_list(list) do
      send_resp(conn, :no_content, "")
    end
  end
end
