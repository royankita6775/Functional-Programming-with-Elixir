#Write an Elixir script that declares a variable and sets its value to 123.
#Print the value of the variable to the console.
#Add code that asks a text line from the user (use IO.gets).
#Add text <- You said that to the text that user entered.
#Print the combined text into the console.

x = 123

IO.puts "The variable value is: #{x}"

IO.puts "Please enter a text line"
text = IO.gets("")
combined_text = "You said that: #{String.trim(text)}"
IO.puts "#{combined_text}"

#Part 2
#Write an Elixir script that calculates the result of 154 divided by 78 and prints it to the console.
#Get the result of calculation (step 1) rounded to nearest integer and print it to console.
#Get the result of calculation (step 1) and print only the integer part of it into the console.

r = 154/78
IO.puts "The result of 154 divided by 78 is: #{r}"
IO.puts "Rounded to nearest integer value is: #{round(r)}"
IO.puts "The integer part of the value is: #{trunc(r)}"

# Part 3
# Ask a line of text from the user (use IO.gets).
# Print the number of characters in string that user entered.
# Print the entered text in reverse.
# Replace the word foo in entered text with bar and print resulted string into the console.

IO.puts "Please enter another text line"
text2 = String.trim(IO.gets(""))
IO.puts "The number of characters in the enterd text is #{String.length(text2)}"

reversed_text = String.reverse(text2)
IO.puts("Reversed text: #{reversed_text}")

modified_text = String.replace(text2, "foo", "bar")
IO.puts("Modified text: #{modified_text}")


# Part 4
# Write an anonymous function that takes three parameters and calculates a product (multiplication) of those three values.
# Ask three numbers from user (use IO.gets and String.to_integer) and pass them to your function created in step 1.
# Print the result to the console.
# Write an anonymous function that concats two lists and returns the result.
# Call the list concat function and print the results.
# Declare a tuple with atoms ok and fail.
# Add new atom canceled and print the combined tuple.

product_function = fn a, b, c -> a * b * c end

IO.puts("Please enter the first number:")
first_number = String.to_integer(IO.gets(""))

IO.puts("Please enter the second number:")
second_number = String.to_integer(IO.gets(""))

IO.puts("Please enter the third number:")
third_number = String.to_integer(IO.gets(""))

result = product_function.(first_number, second_number, third_number)
IO.puts("The product of the three numbers is: #{result}")

concat_lists = fn list1, list2 -> list1 ++ list2 end

list1 = [1, 2, 3]
list2 = [4, 5, 6]
concatenated_list = concat_lists.(list1, list2)
IO.puts("Concatenated list: #{inspect(concatenated_list)}")

result_tuple = {:ok, :fail}

result_tuple_with_canceled =
  case result_tuple do
    {:ok, _} -> {:ok, :canceled}
    _ -> {:fail, :canceled}
  end

IO.puts("Combined tuple with 'canceled': #{inspect(result_tuple_with_canceled)}")
