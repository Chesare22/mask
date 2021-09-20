defmodule Bytes do
  def subtract(<<minuend>>, <<subtrahend>>), do: <<minuend - subtrahend>>

  def subtract(<<minuend, minuend_tail::bitstring>>, <<subtrahend, subtrahend_tail::bitstring>>),
    do: <<minuend - subtrahend, subtract(minuend_tail, subtrahend_tail)::bitstring>>

  def join(bytes, joiner \\ "")
  def join(<<head>>, _), do: "#{head}"
  def join(<<head, tail::bitstring>>, joiner), do: "#{head}#{joiner}#{join(tail, joiner)}"
end
