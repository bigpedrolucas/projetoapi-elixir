defmodule ProjetoApi do
  def main(_argv) do
    artista = IO.gets("Digite o nome do artista:\n") |> String.trim()
    musica  = IO.gets("Digite o nome da musica:\n")  |> String.trim()
    Lyrics.obter_letra(artista, musica)
    |> Resultado.mostrar_resultado
  end

end
