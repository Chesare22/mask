defmodule Mask do
  def of(n) when n in 0..32 do
    ones = Bits.duplicate(1, n)
    ceros = Bits.duplicate(0, 32 - n)
    <<ones::bitstring, ceros::bitstring>>
  end

  def wildcard(n), do: Bytes.subtract(Mask.of(32), Mask.of(n))
end
