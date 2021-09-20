defmodule Mask.CLI do
  def main(argv) do
    argv
    |> parse_args()
    |> process()
    |> Bytes.join(".")
    |> IO.puts()
  end

  def parse_args(argv) do
    parse =
      OptionParser.parse(argv,
        switches: [wildcard: :boolean],
        aliases: [w: :wildcard]
      )

    case parse do
      {[wildcard: true], [number], _} ->
        {Integer.parse(number) |> elem(0), :wildcard}

      {_, [number], _} ->
        Integer.parse(number) |> elem(0)
    end
  end

  def process({number, :wildcard}),
    do: Mask.wildcard(number)

  def process(number),
    do: Mask.of(number)
end
