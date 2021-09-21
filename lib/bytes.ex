defmodule Bytes do
  def subtract(<<minuend>>, <<subtrahend>>), do: <<minuend - subtrahend>>

  def subtract(<<minuend, minuend_tail::bitstring>>, <<subtrahend, subtrahend_tail::bitstring>>),
    do: <<minuend - subtrahend, subtract(minuend_tail, subtrahend_tail)::bitstring>>

  @doc """
  Converts a function that works on one byte into a function that works on a bitstring of multiple bytes
  """
  def map(<<>>, _), do: <<>>
  def map(<<head, tail::bitstring>>, fun), do: <<fun.(head)::8, map(tail, fun)::bitstring>>

  def join(bytes, joiner \\ "")
  def join(<<head>>, _), do: "#{head}"
  def join(<<head, tail::bitstring>>, joiner), do: "#{head}#{joiner}#{join(tail, joiner)}"
end
