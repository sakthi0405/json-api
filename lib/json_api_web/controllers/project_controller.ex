defmodule JsonApiWeb.ProjectController do
  use JsonApiWeb, :controller

  alias JsonApi.Product
  alias JsonApi.Product.Project

  action_fallback JsonApiWeb.FallbackController

  def index(conn, _params) do
    projects = Product.list_projects()
    render(conn, :index, projects: projects)
  end

  def create(conn, %{"project" => project_params}) do
    with {:ok, %Project{} = project} <- Product.create_project(project_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/projects/#{project}")
      |> render(:show, project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Product.get_project!(id)
    render(conn, :show, project: project)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Product.get_project!(id)

    with {:ok, %Project{} = project} <- Product.update_project(project, project_params) do
      render(conn, :show, project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Product.get_project!(id)

    with {:ok, %Project{}} <- Product.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end
