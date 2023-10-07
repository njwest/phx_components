defmodule Playground.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Playground.Content` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        name: "some name",
        category: :horror,
        body: "some body"
      })
      |> Playground.Content.create_post()

    post
  end
end
