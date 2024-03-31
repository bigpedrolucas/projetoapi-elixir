defmodule ProjetoApiTest do
  use ExUnit.Case
  doctest ProjetoApi

  test "greets the world" do
    assert ProjetoApi.hello() == :world
  end
end
