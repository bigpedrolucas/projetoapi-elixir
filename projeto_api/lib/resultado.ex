defmodule Resultado do
  def mostrar_resultado({ :error, r}) do
    IO.puts("Ocorreu o seguinte erro: " <> r)
  end

  def mostrar_resultado({ :ok, json}) do
    { :ok, issues} = Poison.decode(json)
    mostrar_issues(issues)
  end

  defp mostrar_issues([]), do: nil

  defp mostrar_issues(i) do
    #Traduzir o texto em espanhol para português br.
    lyrics = i["lyrics"]
    |> String.replace("Paroles de la chanson", "Letras da música")
    |> String.replace("par", "por")
    IO.puts("\n#{lyrics}")
  end

end
