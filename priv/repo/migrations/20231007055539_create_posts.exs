defmodule Playground.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string
      add :body, :string
      add :category, :string

      timestamps()
    end
  end
end
