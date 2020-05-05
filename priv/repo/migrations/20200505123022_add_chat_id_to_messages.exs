defmodule Chat.Repo.Migrations.AddChatIdToMessages do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      add :chat_id, :integer
    end
  end
end
