defmodule Identicon do
  def main(input) do
    input
    |> hash_string
    |> pick_color
  end

  def pick_color(image) do
    %Identicon.Image{hex: [red, green, blue | _tail]} = image
    [red, green, blue]
    tail
  end

  def hash_string(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
