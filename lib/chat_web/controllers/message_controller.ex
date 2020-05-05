defmodule ChatWeb.MessageController do
  use ChatWeb, :controller

  def index(conn, _params) do
    messages = Chat.Repo.all(Chat.Message)
    render conn, "index.json", messages: messages
  end

  def show(conn, %{"id" => id}) do
    message = Chat.Repo.get!(Chat.Message, id)
    render(conn, "show.json", message: message)
  end

  def create(conn, _params) do
    if _params["message"]["chat_id"] == nil do
      chat =  Chat.Chat.changeset(%Chat.Chat{}, %{user_id: 1, status: 0})
                   |> Chat.Repo.insert()
      %{_params["message"] | "chat_id" => chat.id }
    end

    {:ok, message} =
      Chat.Message.changeset(%Chat.Message{}, _params["message"])
      |> Chat.Repo.insert()

    ChatWeb.Endpoint.broadcast("room:lobby", "shout", _params["message"])
    render(conn, "show.json", message: message)
  end
end