defmodule Chat.Factory do
  use ExMachina.Ecto, repo: Chat.Repo

  def message_factory do
    %Chat.Message{
      name: "Client",
      message: "Hello!"
    }
  end

  def chat_factory do
    %Chat.Chat{
      user_id: 1,
      status: 0
    }
  end
end