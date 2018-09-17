defmodule EnadeAPI.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string
      add :score, :float
      add :student_mean, :float
      add :institution_id, references(:institutions)
    end

  end
end
