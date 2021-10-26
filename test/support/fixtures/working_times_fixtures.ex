defmodule Miniproject01.WorkingTimesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Miniproject01.WorkingTimes` context.
  """

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{
        end: ~N[2021-10-25 09:06:00],
        start: ~N[2021-10-25 09:06:00]
      })
      |> Miniproject01.WorkingTimes.create_working_time()

    working_time
  end
end
