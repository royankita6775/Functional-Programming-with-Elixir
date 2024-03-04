# Part 1
# Declare a keyword list that contains name of the color and color html value.
# See html color values here
# Add at least 10 colors to the keyword list
# Create a loop that asks user the color name or color html value.
# If entered text begins with '#', print the corresponding color name.
# Otherwise print the corresponding html color value.
# If neither is found in keyword list, exit the loop.

defmodule ColorChecker do
  # Declare a keyword list containing color names and HTML color values
  @colors [
    red: "#FF0000",
    green: "#00FF00",
    blue: "#0000FF",
    yellow: "#FFFF00",
    cyan: "#00FFFF",
    magenta: "#FF00FF",
    black: "#000000",
    white: "#FFFFFF",
    gray: "#808080",
    orange: "#FFA500"
  ]

  # Define a function to handle the color lookup
  def lookup_color do
    IO.puts("Enter a color name or HTML color value (or type 'exit' to quit): ")
    input = IO.gets(" ") |> String.trim()

    case input do
      "exit" -> :ok
      _ ->
        if String.starts_with?(input, "#") do
          # Search for color name corresponding to HTML color value
          color_name = Enum.find_value(@colors, fn {name, html_value} -> html_value == input end)
          case color_name do
            nil -> IO.puts("No color name found for HTML color value #{input}")
            name -> IO.puts("The corresponding color name for #{input} is #{name}")
          end
        else
          # Search for HTML color value corresponding to color name
          html_value = Keyword.get(@colors, String.to_existing_atom(input))
          case html_value do
            nil -> IO.puts("No HTML color value found for color name #{input}")
            value -> IO.puts("The corresponding HTML color value for #{input} is #{value}")
          end
        end
        lookup_color()
    end
  end
end

# Start the color lookup process
ColorChecker.lookup_color()


# Part 2
# Declare a map that contains book ISBN as a key and book name as a value.
# Add at least 5 books into the map
# Create a loop that reads commands from the user:
# list lists all books in the map.
# search ISBN searches a book with specified ISBN and prints book info.
# add ISBN,NAME adds new book into the map.
# remove ISBN removes book with ISBN if found on map.
# quit exits the loop.

defmodule BookManager do
  @books %{
    "978-0596521301" => "Programming Elixir",
    "978-1937785581" => "Elixir in Action",
    "978-1449369432" => "Metaprogramming Elixir",
    "978-1680501667" => "Phoenix in Action",
    "978-0134685991" => "Designing Elixir Systems with OTP"
  }

  def start() do
    loop(@books)
  end

  def loop(books) do
    IO.puts("Enter a command (list, search ISBN, add ISBN,NAME, remove ISBN, quit): ")
    input = IO.gets(" ") |> String.trim()

    case String.split(input) do
      ["list"] -> list_books(books)
      ["search", isbn] -> search_book(isbn, books)
      ["add", isbn, name] -> add_book(isbn, name, books)
      ["remove", isbn] -> remove_book(isbn, books)
      ["quit"] -> :ok
      _ -> IO.puts("Invalid command")
    end

    unless input == "quit" do
      loop(books)
    end
  end

  def list_books(books) do
    IO.puts("List of books:")
    Enum.each(books, fn {isbn, name} -> IO.puts("#{isbn}: #{name}") end)
  end

  def search_book(isbn, books) do
    case Map.get(books, isbn) do
      nil -> IO.puts("Book with ISBN #{isbn} not found")
      name -> IO.puts("Book with ISBN #{isbn}: #{name}")
    end
  end

  def add_book(isbn, name, books) do
    case Map.get(books, isbn) do
      nil ->
        updated_books = Map.put(books, isbn, name)
        IO.puts("Book with ISBN #{isbn} added: #{name}")
        {updated_books, :ok}
      _ ->
        IO.puts("Book with ISBN #{isbn} already exists")
        {books, :error}
    end
  end

  def remove_book(isbn, books) do
    case Map.get(books, isbn) do
      nil -> IO.puts("Book with ISBN #{isbn} not found")
      _ ->
        updated_books = Map.delete(books, isbn)
        IO.puts("Book with ISBN #{isbn} removed")
        {updated_books, :ok}
    end
  end
end

BookManager.start()
