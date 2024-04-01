defmodule ProjetoApi do
  def main(_argv) do
    # Puts para limpar o terminal
    IO.puts("\e[2J\e[H")
    # Pergunta informações ao usuário
    artista = IO.gets("Digite o nome do artista: ") |> String.trim()

    if artista == "0" do
      IO.puts("Programa encerrado!")
      System.halt(0)
    end

    musica = IO.gets("Digite o nome da musica: ") |> String.trim()

    # Obtém o inteiro da resposta do usuário
    {traduzir, _} =
      IO.gets("Você quer traduzir a letra da musica para português?(0 = não, 1 = sim): ")
      |> Integer.parse()

    Lyrics.obter_letra(artista, musica)
    |> Resultado.mostrar_resultado(traduzir)
  end
end
