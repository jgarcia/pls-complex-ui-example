defmodule ExJournoNoSchemaWeb.PostLive.New do
  use ExJournoNoSchemaWeb, :live_view

  alias ExJournoNoSchemaWeb.PostLive.Components
  alias ExJournoNoSchemaWeb.NavigationLive

  def render(assigns) do
    ~H"""
    {live_render(@socket, NavigationLive, session: %{}, id: "navigation", sticky: true)}
    <div class="grid grid-cols-1 sm:grid-cols-3 lg:grid-cols-3 gap-5">
      <div class="col-span-2 rounded-xl dark:border-gray-600 h-396">
        <.live_component module={Components.Title} id="post_title" title={@title} />
        <.live_component module={Components.Body} id="post_body" />
      </div>
      <div class="col-span-1">
        <div class="grid grid-cols-1 gap-5">
          <div class="border-2 border-dashed border-gray-300 rounded-xl dark:border-gray-600 h-24 p-4">
            <.live_component module={Components.Footer} id="post_footer" />
          </div>
          <div class="border-2 border-dashed border-gray-300 rounded-xl dark:border-gray-600 h-24 p-4">
            <.live_component module={Components.Slug} id="post_slug" title={@title} />
          </div>
          <div class="border-2 border-dashed border-gray-300 rounded-xl dark:border-gray-600 h-48 p-4">
            <.live_component
              module={Components.AddVenue}
              id="post_add_venue"
              venue_name={@venue_name}
            />
            <.live_component module={Components.Venues} id="post_venues" venues={@venues} />
          </div>
        </div>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       title: "New Post",
       venues: ["Tacos en la esquina"],
       venue_name: nil
     )}
  end

  def handle_info({:title_updated, _id, title}, socket) do
    {:noreply, socket |> assign(:title, title)}
  end

  def handle_info({:venue_added, _id, venue}, socket) do
    IO.puts("Received message from component: #{venue}")

    old_venues = socket.assigns.venues
    new_venues = old_venues ++ [venue]

    {:noreply,
     socket
     |> assign(:venue_name, nil)
     |> assign(:venues, new_venues)}
  end

  def handle_info({:publish, _id, _date}, socket) do
    IO.puts("Publish the post on the database")
    {:noreply, socket}
  end

  def handle_info({msg, source, _data}, socket) do
    IO.puts("Received message #{inspect(msg)} from #{inspect(source)}")
    {:noreply, socket}
  end
end
