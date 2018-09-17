defmodule EnadeAPI.Enade.Course do
  use Ecto.Schema
  import Ecto.Changeset


  schema "courses" do
    field :name, :string
    field :score, :float
    field :student_mean, :float
    
    belongs_to :institution, EnadeAPI.Enade.Institution
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:name, :score, :student_mean, :institution_id])
    |> validate_required([:name, :score, :student_mean])
  end
end
