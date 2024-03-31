defmodule Lyrics do
  @url "https://api.lyrics.ovh/v1/"

  def obter_letra(artista, musica) do
    # Montando os dados
    url = "#{@url}#{artista}/#{musica}"
    # Enviando os dados para a API e obtendo a letra.
    HTTPoison.get(url)
    |> ProcessadorApi.processar_resposta(:lyrics)
  end

end
