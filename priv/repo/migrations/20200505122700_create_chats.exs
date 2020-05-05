defmodule Chat.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :user_id, :integer
      add :status, :integer

      timestamps()
    end

  end
end
