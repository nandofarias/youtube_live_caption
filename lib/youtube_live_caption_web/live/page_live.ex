defmodule YoutubeLiveCaptionWeb.PageLive do
  use YoutubeLiveCaptionWeb, :live_view

  alias YoutubeLiveCaption.HTTPClient

  @impl true
  def mount(params, _session, socket) do
    seq = Map.get(params, "seq", "1")
    {:ok, assign(socket, url: "", text: "", seq: String.to_integer(seq))}
  end

  @impl true
  def handle_event("post", %{"url" => url, "text" => text}, socket = %{assigns: %{seq: seq}}) do
    case HTTPClient.post_caption(url, text, seq) do
      :ok ->
        {:noreply,
         socket
         |> put_flash(:info, "Caption(#{seq}): #{text}")
         |> assign(seq: seq + 1, url: url)}

      {:error, error} when is_binary(error) ->
        {:noreply,
         socket
         |> put_flash(:error, error)
         |> assign(text: text, url: url)}

      {:error, _error} ->
        {:noreply,
         socket
         |> put_flash(:error, "Connection error, try again")
         |> assign(text: text, url: url)}
    end
  end
end
