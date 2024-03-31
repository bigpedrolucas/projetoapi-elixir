defmodule Lyrics do
  @url "https://api.lyrics.ovh/v1/"

  def obter_letra(artista, musica) do
    url = "#{@url}#{artista}/#{musica}"
    HTTPoison.get(url)
    |> processa_resposta
  end

  defp processa_resposta({ :ok,  %HTTPoison.Response { status_code: 200, body: b}}) do
    { :ok, b}
  end

  defp processa_resposta({ :error, r }), do: { :error, r}
  defp processa_resposta({ :ok,  %HTTPoison.Response { status_code: _, body: b}}) do
    { :error, b}
  end
end
