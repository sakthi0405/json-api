# defmodule JsonApiWeb.ListControllerTest do
#   use JsonApiWeb.ConnCase

#   import JsonApi.ProductFixtures

#   alias JsonApi.Product.List

#   @create_attrs %{

#   }
#   @update_attrs %{

#   }
#   @invalid_attrs %{}

#   setup %{conn: conn} do
#     {:ok, conn: put_req_header(conn, "accept", "application/json")}
#   end

#   describe "index" do
#     test "lists all list", %{conn: conn} do
#       conn = get(conn, ~p"/api/list")
#       assert json_response(conn, 200)["data"] == []
#     end
#   end

#   describe "create list" do
#     test "renders list when data is valid", %{conn: conn} do
#       conn = post(conn, ~p"/api/list", list: @create_attrs)
#       assert %{"id" => id} = json_response(conn, 201)["data"]

#       conn = get(conn, ~p"/api/list/#{id}")

#       assert %{
#                "id" => ^id
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn} do
#       conn = post(conn, ~p"/api/list", list: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "update list" do
#     setup [:create_list]

#     test "renders list when data is valid", %{conn: conn, list: %List{id: id} = list} do
#       conn = put(conn, ~p"/api/list/#{list}", list: @update_attrs)
#       assert %{"id" => ^id} = json_response(conn, 200)["data"]

#       conn = get(conn, ~p"/api/list/#{id}")

#       assert %{
#                "id" => ^id
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn, list: list} do
#       conn = put(conn, ~p"/api/list/#{list}", list: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "delete list" do
#     setup [:create_list]

#     test "deletes chosen list", %{conn: conn, list: list} do
#       conn = delete(conn, ~p"/api/list/#{list}")
#       assert response(conn, 204)

#       assert_error_sent 404, fn ->
#         get(conn, ~p"/api/list/#{list}")
#       end
#     end
#   end

#   defp create_list(_) do
#     list = list_fixture()
#     %{list: list}
#   end
# end
