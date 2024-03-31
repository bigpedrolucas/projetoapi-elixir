defmodule Resultado do
  def mostrar_resultado({ :error, r}) do
    IO.puts("Ocorreu o seguinte erro: " <> r)
  end

  def mostrar_resultado({ :ok, json}) do
    { :ok, issues} = Poison.decode(json)
    {traduzir, _} = IO.gets("Você quer traduzir a letra da musica para português?(0 = não, 1 = sim)\n") |> Integer.parse
    mostrar_issues(issues, traduzir)
  end

  defp mostrar_issues([], _), do: nil
  defp mostrar_issues(i, 0) do
    #Traduzir o texto inicial de espanhol para português
    lyrics = i["lyrics"]
    |> String.replace("Paroles de la chanson", "Letras da música")
    |> String.replace("par", "de")
    IO.puts("\n#{lyrics}")
  end

  defp mostrar_issues(i, 1) do
    # Chamar a função para traduzir o texto completo
    lyrics = i["lyrics"]
    |> String.replace("par", "de")
    |> Traducao.traduzir_letra()

    case lyrics do
      {:ok, translated_lyrics} ->
        IO.puts("\n#{translated_lyrics}")
      {:error, error_message} ->
        IO.puts("Erro ao traduzir as letras: #{error_message}")
    end
  end

  defp mostrar_issues(_, _), do: IO.puts("\nOpção inválida")

end
