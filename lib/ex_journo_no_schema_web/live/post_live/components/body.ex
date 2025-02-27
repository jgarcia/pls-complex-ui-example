defmodule ExJournoNoSchemaWeb.PostLive.Components.Body do
  use ExJournoNoSchemaWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="form-group">
      <textarea class="form-control" phx-target={@myself} phx-debounce="500" phx-blur="update_body"></textarea>
    </div>
    """
  end

  def handle_event("update_body", %{"value" => body}, socket) do
    IO.puts("Save the body here and notify the parent live view")
    send(self(), {:update_body, socket.assigns.id, body})
    {:noreply, socket}
  end
end
