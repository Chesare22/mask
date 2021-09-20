defmodule Bits do
  def duplicate(bit, n) when n >= 0,
    do: _duplicate(bit, n, <<>>)

  defp _duplicate(_, 0, acc), do: acc
  defp _duplicate(bit, n, acc), do: _duplicate(bit, n - 1, <<bit::1, acc::bitstring>>)
end
