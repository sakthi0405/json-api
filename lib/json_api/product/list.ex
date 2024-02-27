defmodule JsonApi.Product.List do
  use Ecto.Schema
  import Ecto.Changeset
  # alias JsonApi.Product.List

  schema "list" do
    field :name, :string
    field :content, :string
    field :view_count, :integer
    field :published, :boolean
    belongs_to :project, JsonApi.Product.List

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :content, :view_count, :published, :project_id])
    |> validate_required([:name])
  end
end
