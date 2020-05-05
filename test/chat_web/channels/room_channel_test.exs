defmodule ChatWeb.RoomChannelTest do
  use ChatWeb.ChannelCase

  setup do
    {:ok, _, socket} =
      socket(ChatWeb.UserSocket, "user_id", %{some: :assign})
      |> subscribe_and_join(ChatWeb.RoomChannel, "room:lobby")

    {:ok, socket: socket}
  end

  test "ping replies with status ok", %{socket: socket} do
    ref = push socket, "ping", %{"hello" => "there"}
    assert_reply ref, :ok, %{"hello" => "there"}
  end

  test "shout broadcasts to room:lobby", %{socket: socket} do
    push socket, "shout", %{"name" => "guest", "message" => "Hi!"}
    assert_broadcast "shout", %{"name" => "guest", "message" => "Hi!"}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "broadcast", %{"some" => "data"}
    assert_push "broadcast", %{"some" => "data"}
  end
end
