defmodule ProcessadorApi do
  def processar_resposta({ :ok,  %HTTPoison.Response { status_code: 200, body: b}},:lyrics) do
    { :ok, b}
  end
  #processar a resposta, porém com a tag traducao, para saber qual API é.
  def processar_resposta({ :ok,  %HTTPoison.Response { status_code: 200, body: b}},:traducao) do
    handle_translation_response(b)
  end

  #tratamento de exceções
  def processar_resposta({ :error, r }, _), do: { :error, r}
  def processar_resposta({ :ok,  %HTTPoison.Response { status_code: _, body: b}}, _) do
    { :error, b}
  end

  #trata o mapa obtido após decodificar o body
  defp handle_translation_response(body) do
    case Poison.decode(body) do
      {:ok, %{"data" => %{"translations" => [translation]}}} ->
        {:ok, translation["translatedText"]}
      _ ->
        {:error, "Resposta da API de tradução em um formato inesperado"}
    end
  end

end
