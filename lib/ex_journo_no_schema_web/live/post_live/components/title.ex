defmodule ExJournoNoSchemaWeb.PostLive.Components.Title do
  use ExJournoNoSchemaWeb, :live_component

  def render(assigns) do
    ~H"""
    <form phx-change="title:validate" phx-submit="title:update" phx-target={@myself}>
      <input type="text" name="title" value={@title} />
    </form>
    """
  end

  def handle_event("title:update", %{"title" => title}, socket) do
    IO.puts("Save to the database")
    send(self(), {:title_updated, socket.assigns.id, title})
    # do not modify the socket
    {:noreply, socket}
  end

  def handle_event("title:validate", %{"title" => title}, socket) do
    IO.puts("Validate title: #{title}")
    # Don't send message to the parent liveview unless necessary
    {:noreply, socket}
  end
end
