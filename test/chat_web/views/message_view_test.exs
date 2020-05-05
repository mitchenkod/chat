defmodule ChatWeb.MessageViewTest do
  import Chat.Factory
  alias ChatWeb.MessageView
  use ChatWeb.ConnCase, async: true

  test "message_json" do
    message = insert(:message)

    rendered_message = MessageView.message_json(message)

    assert rendered_message == %{
             name: message.name,
             message: message.message,
           }
  end

  test "index.json" do
    message = insert(:message)

    rendered_message = MessageView.render("index.json", %{messages: [message]})

    assert rendered_message == %{
             messages: [MessageView.message_json(message)]
           }
  end

  test "show.json" do
    message = insert(:message)

    rendered_message = MessageView.render("show.json", %{message: message})

    assert rendered_message == %{
             message: MessageView.message_json(message)
           }
  end
end