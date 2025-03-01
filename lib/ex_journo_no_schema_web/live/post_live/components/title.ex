defmodule ExJournoNoSchemaWeb.PostLive.Components.Title do
  use ExJournoNoSchemaWeb, :live_component

  def render(assigns) do
    ~H"""
    <form phx-change="title:validate" phx-submit="title:update" phx-target={@myself}>
      <div class="mb-6">
        <label for="large-input" class="block mb-2 text-sm font-medium text-gray-900 ">
          Title
        </label>
        <input
          name="title"
          value={@title}
          type="text"
          class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 text-base focus:ring-blue-500 focus:border-blue-500 -dark:bg-gray-700 -dark:border-gray-600 -dark:placeholder-gray-400 -dark:text-white -dark:focus:ring-blue-500 -dark:focus:border-blue-500"
        />
      </div>
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
