defmodule ChatWeb.MessageController do
  use ChatWeb, :controller

  def index(conn, _params) do
    messages = Chat.Repo.all(Chat.Message)
    render conn, "index.json", messages: messages
  end

  def show(conn, %{"id" => id}) do
    message = Chat.Repo.get!(Message, id)
    render(conn, "show.json", message: message)
  end
end