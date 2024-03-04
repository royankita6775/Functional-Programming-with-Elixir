# Part 1
# Implement a Elixir script that:
# Ask a number from the user.
# If given number is evenly divisible by 3, print Divisible by 3.
# If given number is evenly divisible by 5, print Divisible by 5.
# If given number is evenly divisible by 7, print Divisible by 7.
# If given number is not evenly divisible by 3, 5 or 7, find smallest value (excluding 1) that number is evenly divisible for and print that value to the output.

defmodule NumberChecker do
  def main do
    IO.puts("Enter a number:")
    input = IO.gets(" ") |> String.trim() |> String.to_integer()

    case {divisible_by_3(input), divisible_by_5(input), divisible_by_7(input)} do
      {true, _, _} -> IO.puts("Divisible by 3")
      {_, true, _} -> IO.puts("Divisible by 5")
      {_, _, true} -> IO.puts("Divisible by 7")
      {_, _, _} ->
        smallest_divisor = smallest_divisor(input)
        IO.puts("Smallest divisor (excluding 1): #{smallest_divisor}")
    end
  end

  defp divisible_by_3(number), do: rem(number, 3) == 0
  defp divisible_by_5(number), do: rem(number, 5) == 0
  defp divisible_by_7(number), do: rem(number, 7) == 0

  defp smallest_divisor(number) do
    Enum.find(2..(div(number, 2)), fn divisor -> rem(number, divisor) == 0 end)
  end
end

NumberChecker.main()


# Part 2
# Write an anonymous function that takes two parameters:
# Use a guard to check if both parameters are a string type. If so, return a combined string of the parameters.
# If parameters are not strings, return the addition result of the parameters.
# Test your anonymous function with string and number parameters and print the results.


# Define the anonymous function
anonymous_function = fn
  a, b when is_binary(a) and is_binary(b) -> a <> b
  a, b -> a + b
end

# Test with string parameters
IO.puts(anonymous_function.("Hello", " world"))  # Output: Hello world

# Test with number parameters
IO.puts(anonymous_function.(5, 7))  # Output: 12
