defmodule ChatWeb.ChatController do
  use ChatWeb, :controller

  def show(conn, %{"id" => id }) do
    chat = Chat.Repo.get!(Chat.Chat, id)
    messages = chat.messages

    render(conn, "show.html", messages: messages)
  end
end