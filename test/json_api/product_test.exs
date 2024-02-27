defmodule JsonApi.ProductTest do
  use JsonApi.DataCase

  alias JsonApi.Product

  describe "projects" do
    alias JsonApi.Product.Project

    import JsonApi.ProductFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Product.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Product.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Project{} = project} = Product.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Product.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Project{} = project} = Product.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Product.update_project(project, @invalid_attrs)
      assert project == Product.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Product.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Product.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Product.change_project(project)
    end
  end

  describe "list" do
    alias JsonApi.Product.List

    import JsonApi.ProductFixtures

    @invalid_attrs %{}

    test "list_list/0 returns all list" do
      list = list_fixture()
      assert Product.list_list() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert Product.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      valid_attrs = %{}

      assert {:ok, %List{} = list} = Product.create_list(valid_attrs)
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Product.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      update_attrs = %{}

      assert {:ok, %List{} = list} = Product.update_list(list, update_attrs)
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = Product.update_list(list, @invalid_attrs)
      assert list == Product.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Product.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Product.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Product.change_list(list)
    end
  end
end
