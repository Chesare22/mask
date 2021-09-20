defmodule MaskCliTest do
  use ExUnit.Case
  doctest MaskCli

  test "greets the world" do
    assert MaskCli.hello() == :world
  end
end
