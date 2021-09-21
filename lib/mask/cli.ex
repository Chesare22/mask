defmodule Mask.CLI do
  def main(argv) do
    argv
    |> parse_args()
    |> process_kleisli()
    |> result_to_string()
    |> IO.puts()
  end

  def parse_args(argv) do
    parse =
      OptionParser.parse(argv,
        switches: [wildcard: :boolean, binary: :boolean],
        aliases: [w: :wildcard, b: :binary]
      )

    case parse do
      {flags, [number], _} ->
        [
          {:number, Integer.parse(number) |> elem(0)},
          {:wildcard, Keyword.has_key?(flags, :wildcard)},
          {:binary, Keyword.has_key?(flags, :binary)}
        ]
    end
  end

  def process(number: number, wildcard: true),
    do: Mask.wildcard(number)

  def process(number: number, wildcard: false),
    do: Mask.of(number)

  def process_kleisli([number, wildcard, binary]),
    do: [process([number, wildcard]), binary]

  def result_to_string([result, binary: true]),
    do:
      result
      |> Bytes.map_list(&Bits.join(&1))
      |> Enum.join(".")

  def result_to_string([result, binary: false]),
    do: result |> Bytes.join(".")
end
