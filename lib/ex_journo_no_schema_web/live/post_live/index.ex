defmodule ExJournoNoSchemaWeb.PostLive.Index do
  use ExJournoNoSchemaWeb, :live_view

  alias ExJournoNoSchemaWeb.NavigationLive

  def render(assigns) do
    ~H"""
    {live_render(@socket, NavigationLive, session: %{}, id: "navigation", sticky: true)} All Posts
    All Posts Here
    """
  end
end
