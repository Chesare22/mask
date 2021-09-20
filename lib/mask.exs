defmodule Bytes4 do
  def subtract(<<a1, b1, c1, d1>>, <<a2, b2, c2, d2>>),
    do: <<a1 - a2, b1 - b2, c1 - c2, d1 - d2>>

  def to_string(<<a, b, c, d>>), do: "#{a}.#{b}.#{c}.#{d}"
end

defmodule Bits do
  def duplicate(bit, n) when n >= 0,
    do: _duplicate(bit, n, <<>>)

  defp _duplicate(_, 0, acc), do: acc
  defp _duplicate(bit, n, acc), do: _duplicate(bit, n - 1, <<bit::1, acc::bitstring>>)
end

defmodule Mask do
  def of(n) when n in 0..32 do
    ones = Bits.duplicate(1, n)
    ceros = Bits.duplicate(0, 32 - n)
    <<ones::bitstring, ceros::bitstring>>
  end

  def wildcard(n), do: Bytes4.subtract(Mask.of(32), Mask.of(n))
  def wildcard_str(n), do: n |> wildcard |> Bytes4.to_string()
end
