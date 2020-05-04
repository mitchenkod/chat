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
    {:ok, message} =
      Chat.Message.changeset(%Chat.Message{}, _params[:message])
      |> Chat.Repo.insert()
    render(conn, "show.json", message: message)
  end
end