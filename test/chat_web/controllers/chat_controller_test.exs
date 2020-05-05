defmodule ChatWeb.ChatControllerTest do
  use ChatWeb.ConnCase

  test "#show chats messages" do
    conn = build_conn()

    chat = insert(:chat)
    message = insert(:message, chat: chat)

    conn = get conn, ChatWeb.Router.Helpers.chat_path(conn, :show, chat)

    assert html_response(conn, 200) =~ "msg-list"
  end
end