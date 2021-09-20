defmodule Bytes4 do
  def subtract(<<a1, b1, c1, d1>>, <<a2, b2, c2, d2>>),
    do: <<a1 - a2, b1 - b2, c1 - c2, d1 - d2>>

  def to_string(<<a, b, c, d>>), do: "#{a}.#{b}.#{c}.#{d}"
end
