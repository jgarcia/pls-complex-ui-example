defmodule ExJournoNoSchemaWeb.PostLive.Components.Slug do
  use ExJournoNoSchemaWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      {slug_from(@title)}
    </div>
    """
  end

  def slug_from(title) do
    title
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]/, "-")
    |> String.replace(~r/-+/, "-")
    |> String.replace(~r/^-|-$/, "")
  end
end
