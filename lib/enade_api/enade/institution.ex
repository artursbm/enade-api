defmodule EnadeAPI.Enade.Institution do
  use Ecto.Schema
  import Ecto.Changeset


  schema "institutions" do
    field :global_score, :float
    field :name, :string
    has_many :courses, EnadeAPI.Enade.Course
  end

  @doc false
  def changeset(institution, attrs) do
    institution
    |> cast(attrs, [:name, :global_score])
    |> validate_required([:name, :global_score])
    |> unique_constraint(:name)
  end
end
