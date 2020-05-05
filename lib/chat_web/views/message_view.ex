defmodule ChatWeb.MessageView do
  use ChatWeb, :view

  def render("index.json", %{messages: messages}) do
    %{
      messages: Enum.map(messages, &message_json/1)
    }
  end

  def render("show.json", %{message: message}) do
    %{
      message: message_json(message)
    }
  end

  def message_json(message) do
    %{
      name: message.name,
      message: message.message,
      chat_id: message.chat_id
    }
  end
end