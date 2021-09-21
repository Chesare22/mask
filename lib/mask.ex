defmodule Mask do
  def of(n) when is_integer(n) and n in 0..32 do
    ones = Bits.duplicate(1, n)
    ceros = Bits.duplicate(0, 32 - n)
    <<ones::bitstring, ceros::bitstring>>
  end

  def of(_), do: raise(ArgumentError, "The mask must be an integer between 0 and 32")

  def wildcard(n), do: Mask.of(n) |> Bytes.map(&Bitwise.bnot/1)
end
