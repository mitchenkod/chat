defmodule Chat.Factory do
  use ExMachina.Ecto, repo: Chat.Repo

  def message_factory do
    %Chat.Message{
      name: "Client",
      message: "Hello!"
    }
  end
end