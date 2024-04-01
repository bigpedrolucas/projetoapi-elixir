defmodule Resultado do
  def mostrar_resultado({:error, r}, _) do
    IO.puts("Ocorreu o seguinte erro: " <> r)
    Process.sleep(2000)
    ProjetoApi.main([])
  end

  def mostrar_resultado({:ok, json}, traduzir) do
    {:ok, issues} = Poison.decode(json)
    mostrar_issues(issues, traduzir)

    {novabusca, _} =
      IO.gets("Deseja realizar uma nova busca?(0 = não, 1 = sim): ")
      |> Integer.parse()

    if novabusca == 1, do: ProjetoApi.main([])
  end

  defp mostrar_issues([], _), do: nil

  defp mostrar_issues(i, 0) do
    # Traduzir o texto inicial de espanhol para português
    lyrics =
      i["lyrics"]
      |> String.replace("Paroles de la chanson", "Letras da música")
      |> String.replace("par", "de")

    IO.puts("\n#{lyrics}\n")
  end

  defp mostrar_issues(i, 1) do
    # Chamar a função para traduzir o texto completo
    lyrics =
      i["lyrics"]
      |> String.replace("par", "de")
      |> Traducao.traduzir_letra()
      |> elem(1)

    IO.puts("\n#{lyrics}")
  end

  defp mostrar_issues(_, _), do: IO.puts("\nOpção inválida")
end
