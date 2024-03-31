defmodule Traducao do
  @url "https://translation.googleapis.com/language/translate/v2/"

  def traduzir_letra(texto) do
    url = "#{@url}?key=AIzaSyAs9XIpALxk94Ye12HNBM-UKwPPvbCjRLA"
    body = %{
      q: texto,
      target: "pt_br",
      format: "text"
    }

    case HTTPoison.post(url, Poison.encode!(body), [{"Content-Type", "application/json"}]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        handle_translation_response(body)
      {:error, %HTTPoison.Response{status_code: code, body: body}} ->
        {:error, "Erro #{code}: #{body}"}
    end
  end

  defp handle_translation_response(body) do
    case Poison.decode(body) do
      {:ok, %{"data" => %{"translations" => [translation]}}} ->
        {:ok, translation["translatedText"]}
      _ ->
        {:error, "Resposta da API de tradução em um formato inesperado"}
    end
  end
end
