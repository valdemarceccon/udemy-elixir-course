defmodule Identicon do
  def main(input) do
    input
    |> hash_string
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex}=image) do
    hex
    |> Enum.chunk_every(3)
    |> mirror_row
  end

  def mirror_row(row) do
    [f,s | _tail] = row
    row ++ [s,f]
  end

  def pick_color(%Identicon.Image{hex: [red, green, blue | _tail]} = image) do
    %Identicon.Image{image | color: {red, green, blue}}
  end

  def hash_string(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
