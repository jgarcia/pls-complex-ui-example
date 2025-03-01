defmodule ExJournoNoSchemaWeb.PostLive.Components.Venues do
  use ExJournoNoSchemaWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <span
        :for={venue <- @venues}
        class="bg-blue-100 text-blue-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded-sm dark:bg-gray-700 dark:text-blue-400 border border-blue-400"
      >
        {venue}
      </span>
    </div>
    """
  end
end
