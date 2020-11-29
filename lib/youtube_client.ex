defmodule YoutubeLiveCaption.HTTPClient do
  @moduledoc """
  HTTP Client for Youtube caption, intended to be used in live streams
  """
  use Tesla, only: [:post]

  plug Tesla.Middleware.Logger
  plug Tesla.Middleware.Headers, [{"Content-Type", "text/plain"}]

  @spec post_caption(String.t(), String.t(), pos_integer()) ::
          :ok | {:error, String.t()} | {:error, atom()}
  def post_caption(url, text, seq \\ 1) do
    date = DateTime.utc_now() |> DateTime.to_iso8601() |> String.slice(0..-5)
    body = date <> " region:reg1#cue1\n" <> "#{text}\n"
    response = post(url, body, query: [seq: seq])

    case response do
      {:ok, %{status: 200}} ->
        :ok

      {:ok, %{status: status, body: body}} ->
        {:error, "Unexpected error with status #{status} and reason #{body}"}

      error ->
        error
    end
  end
end
