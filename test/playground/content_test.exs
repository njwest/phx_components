defmodule Playground.ContentTest do
  use Playground.DataCase

  alias Playground.Content

  describe "posts" do
    alias Playground.Content.Post

    import Playground.ContentFixtures

    @invalid_attrs %{name: nil, category: nil, body: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Content.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Content.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{name: "some name", category: :horror, body: "some body"}

      assert {:ok, %Post{} = post} = Content.create_post(valid_attrs)
      assert post.name == "some name"
      assert post.category == :horror
      assert post.body == "some body"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{name: "some updated name", category: :sci_fi, body: "some updated body"}

      assert {:ok, %Post{} = post} = Content.update_post(post, update_attrs)
      assert post.name == "some updated name"
      assert post.category == :sci_fi
      assert post.body == "some updated body"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_post(post, @invalid_attrs)
      assert post == Content.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Content.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Content.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Content.change_post(post)
    end
  end
end
