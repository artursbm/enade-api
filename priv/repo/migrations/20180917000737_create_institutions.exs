defmodule EnadeAPI.Repo.Migrations.CreateInstitutions do
  use Ecto.Migration

  def change do
    create table(:institutions) do
      add :name, :string
      add :global_score, :float

    end

    create unique_index(:institutions, [:name])
  end
end
