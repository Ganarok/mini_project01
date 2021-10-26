defmodule Miniproject01.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string, :required

      timestamps()
    end
  end
end
