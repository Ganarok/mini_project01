defmodule Miniproject01.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Miniproject01.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Miniproject01.Users.create_user()

    user
  end
end
