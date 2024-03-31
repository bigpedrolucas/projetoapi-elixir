defmodule ProjetoApi do
  def main(_argv) do
    # Pergunta informações ao usuário
    artista = IO.gets("Digite o nome do artista:\n") |> String.trim()
    musica  = IO.gets("Digite o nome da musica:\n")  |> String.trim()

    # Obtém o inteiro da resposta do usuário
    {traduzir, _} = IO.gets("Você quer traduzir a letra da musica para português?(0 = não, 1 = sim)\n") |> Integer.parse
    Lyrics.obter_letra(artista, musica)
    |> Resultado.mostrar_resultado(traduzir)
  end

end
