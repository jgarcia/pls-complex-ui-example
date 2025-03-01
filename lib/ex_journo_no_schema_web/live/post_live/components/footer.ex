defmodule ExJournoNoSchemaWeb.PostLive.Components.Footer do
  use ExJournoNoSchemaWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="form-group">
      <button
        type="submit"
        class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800"
        phx-click="post:publish"
        target={@myself}
      >
        Publish post
      </button>
    </div>
    """
  end

  def handle_event("publish", _params, socket) do
    IO.puts("Publish the post on the database")
    send(self(), {:publish, socket.assigns.id, Date.utc_today()})
    {:noreply, socket}
  end
end
