# defmodule JsonApi.Repo.Migrations.CreateList do
#   use Ecto.Migration

#   def change do
#     create table(:list) do
#       add :project_id, references(:projects)
#       add :name, :string
#       add :content, :text
#       add :view_count, :integer
#       add :published, :boolean, default: false

#       timestamps(type: :utc_datetime)
#     end
#   end
# end
