defmodule ExJournoNoSchemaWeb.PostLive.New do
  use ExJournoNoSchemaWeb, :live_view

  alias ExJournoNoSchemaWeb.PostLive.Components
  alias ExJournoNoSchemaWeb.NavigationLive

  def render(assigns) do
    ~H"""
    {live_render(@socket, NavigationLive, session: %{}, id: "navigation", sticky: true)}
    <.live_component module={Components.Title} id="post_title" title={@title} />
    <.live_component module={Components.Slug} id="post_slug" title={@title} />
    <.live_component module={Components.Body} id="post_body" />
    <.live_component module={Components.Footer} id="post_footer" />
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, title: "New Post")}
  end

  def handle_info({:title_updated, _id, title}, socket) do
    {:noreply, socket |> assign(:title, title)}
  end

  def handle_info({msg, source, _data}, socket) do
    IO.puts("Received message #{inspect(msg)} from #{inspect(source)}")
    {:noreply, socket}
  end
end
