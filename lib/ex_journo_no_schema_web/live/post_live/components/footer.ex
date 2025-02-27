defmodule ExJournoNoSchemaWeb.PostLive.Components.Footer do
  use ExJournoNoSchemaWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="form-group">
      <button class="btn btn-primary" phx-click="publish">
        Publish
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
