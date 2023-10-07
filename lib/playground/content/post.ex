defmodule Playground.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :name, :string
    field :category, Ecto.Enum, values: [:horror, :sci_fi, :fantasy, :space]
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :body, :category])
    |> validate_required([:name, :body, :category])
  end
end
