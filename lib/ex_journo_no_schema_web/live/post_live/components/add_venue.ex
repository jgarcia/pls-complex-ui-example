defmodule ExJournoNoSchemaWeb.PostLive.Components.AddVenue do
  use ExJournoNoSchemaWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="mb-6">
      <.form for={@form} phx-submit="venue:add" phx-target={@myself}>
        <label for="default-input" class="block mb-2 text-sm font-medium text-gray-900 ">
          Venue
        </label>
        <input
          type="text"
          id="venue_name"
          name="venue_name"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 -dark:bg-gray-700 -dark:border-gray-600 -dark:placeholder-gray-400 -dark:text-white -dark:focus:ring-blue-500 -dark:focus:border-blue-500"
          value={@venue_name}
        />
      </.form>
    </div>
    """
  end

  def update(assigns, socket) do
    IO.puts("Update venue")

    {:ok,
     socket |> assign(assigns) |> assign(:form, to_form(%{"venue_name" => assigns.venue_name}))}
  end

  def handle_event("venue:add", %{"venue_name" => venue}, socket) do
    IO.puts("Add venue: #{venue}")
    send(self(), {:venue_added, socket.assigns.id, venue})
    new_form = to_form(%{"venue_name" => "", "rand" => :rand.uniform()})
    {:noreply, socket |> assign(:form, new_form)}
  end
end
