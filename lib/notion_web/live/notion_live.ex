defmodule NotionWeb.NotionLive do
  use NotionWeb, :live_view
  alias Notion.Notions

  def mount(_params, _session, socket) do
    Notions.subscribe()

    {:ok, fetch(socket)}
  end

  def handle_event("add", %{"task" => task}, socket) do
    Notions.create_task(task)
    {:noreply, fetch(socket)}
  end

  def handle_info({Notions, [:task | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, tasks: Notions.list_tasks())
  end

end
