defmodule JsonApi.ProductFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JsonApi.Product` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> JsonApi.Product.create_project()

    project
  end

  @doc """
  Generate a list.
  """
  def list_fixture(attrs \\ %{}) do
    {:ok, list} =
      attrs
      |> Enum.into(%{

      })
      |> JsonApi.Product.create_list()

    list
  end
end
