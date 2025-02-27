defmodule ExJournoNoSchemaWeb.PostLive.Components.PublishControls do
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
end
