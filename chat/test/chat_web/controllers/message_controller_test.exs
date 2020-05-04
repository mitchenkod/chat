defmodule ChatWeb.MessageControllerTest do
  use ChatWeb.ConnCase

  test "#index renders a list of messages" do
    conn = build_conn()
    message = insert(:message)

    conn = get conn, ChatWeb.Router.Helpers.message_path(conn, :index)

    assert json_response(conn, 200) == render_json("index.json", messages: [message])
  end

  test "#show renders a messages" do
    conn = build_conn()
    message = insert(:message)

    conn = get conn, ChatWeb.Router.Helpers.message_path(conn, :show, message)

    assert json_response(conn, 200) == render_json("show.json", message: message)
  end

  defp render_json(template, assigns) do
    assigns = Map.new(assigns)
    ChatWeb.MessageView.render(template, assigns)
    |> Poison.encode!
    |> Poison.decode!
  end
end