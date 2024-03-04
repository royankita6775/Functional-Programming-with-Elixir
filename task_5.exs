# Create a source file math.ex and declare a module Math.
# Declare functions Math.add, Math.sub, Math.mul, and Math.div, each taking two parameters.
# Declare a private function Math.info which prints info from above public functions
# The Math.add calls Math.info which prints "Adding x and y" (x and y the actual parameters to Math.add)
# Use Math.info similarly from sub, mul and div functions.

defmodule Math do
  def add(x, y) do
    info("Adding #{x} and #{y}")
    x + y
  end

  def sub(x, y) do
    info("Subtracting #{y} from #{x}")
    x - y
  end

  def mul(x, y) do
    info("Multiplying #{x} by #{y}")
    x * y
  end

  def div(x, y) do
    info("Dividing #{x} by #{y}")
    x / y
  end

  defp info(message) do
    IO.puts(message)
  end
end

# Create a source file calculator.ex and declare module Calculator.
# Declare a function Calculator.calc that takes a string parameter.
# From string parameter, parse a number, operator (+,-,*,/) and second number, for example 123+456
# Call the corresponding Math function based on parsed operator and two numbers.

defmodule Calculator do
  def calc(input) do
    {x, op, y} = parse_input(input)
    case op do
      "+" -> Math.add(x, y)
      "-" -> Math.sub(x, y)
      "*" -> Math.mul(x, y)
      "/" -> Math.div(x, y)
      _ -> {:error, "Invalid operator"}
    end
  end

  defp parse_input(input) do
    [x_str, op_str, y_str] = String.split(input, ~r/[\+\-\*\/]/)
    x = String.to_float(String.replace(x_str, ",", "."))
    y = String.to_float(String.replace(y_str, ",", "."))
    {x, op_str, y}
  end
end

# Create a script that has a loop that asks a string from user
# The text user enters is passed to Calculator.calc function
# Exit the loop if user enters text that does not parse correctly in Calculator.calc

defmodule Main do
  def start do
    loop()
  end

  defp loop do
    IO.puts("Enter a math expression (e.g., 123+456) or 'exit' to quit:")
    input = String.trim(IO.gets(""))
    case input do
      "exit" -> IO.puts("Exiting the calculator.")
      _ ->
        case Calculator.calc(input) do
          {:error, message} -> IO.puts("Error: #{message}")
          result -> IO.puts("Result: #{result}")
        end
        loop()
    end
  end
end

Main.start()
