defmodule JsonApiWeb.ListJSON do
  alias JsonApi.Product.List

  @doc """
  Renders a list of list.
  """
  def index(%{list: list}) do
    %{data: for(list <- list, do: data(list))}
  end

  @doc """
  Renders a single list.
  """
  def show(%{list: list}) do
    %{data: data(list)}
  end

  defp data(%List{} = list) do
    %{
      id: list.id,
      name: list.name,
      published: list.published,
      content: list.content,
      view_count: list.view_count,
      project_id: list.project_id
    }
  end
end
