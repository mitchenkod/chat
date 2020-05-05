defmodule Chat.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chats" do
    field :status, :integer
    field :user_id, :integer

    has_many :messages, Chat.Message
    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:user_id, :status])
    |> validate_required([:user_id, :status])
  end
end
