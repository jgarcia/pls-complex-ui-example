defmodule ExJournoNoSchemaWeb.NavigationLive do
  use ExJournoNoSchemaWeb, :live_view

  def render(assigns) do
    ~H"""
    <nav>
      <ul>
        <li><.link navigate="/posts">Posts</.link></li>
        <li><.link navigate="/posts/new">New</.link></li>
        <li>Comments</li>
      </ul>
    </nav>
    """
  end

  def mount(_params, _session, socket) do
    IO.inspect("Mounting Navigation Live")
    {:ok, socket, layout: false}
  end
end
