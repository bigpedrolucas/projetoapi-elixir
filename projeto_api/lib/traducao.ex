defmodule Traducao do
  @url "https://translation.googleapis.com/language/translate/v2/"

  def traduzir_letra(texto) do
    # Montando os dados
    url = "#{@url}?key=AIzaSyAs9XIpALxk94Ye12HNBM-UKwPPvbCjRLA"
    body = %{
      q: texto,
      target: "pt_br",
      format: "text"
    }
    # Enviando os dados para a API e obtendo a traducao.
    HTTPoison.post(url, Poison.encode!(body), [{"Content-Type", "application/json"}])
    |> ProcessadorApi.processar_resposta(:traducao)
  end
end
