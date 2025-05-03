defmodule HelloElixir do
  use Application

  def start(_type, _args) do
    HelloElixir.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def getPiece(column) do
    case column do
      0 -> "."
      1 -> "O"
      2 -> "X"
    end
  end

  def getReverseTurn(turn) do
    case turn do
      1 -> 2
      2 -> 1
    end
  end

  def printBoard(matrix) do
    matrix
    |> Enum.each(fn row ->
      row
      |> Enum.each(&IO.write(getPiece(&1)));
      IO.puts("");
    end)
  end

  def gameLoop(matrix, turn) do
    try do
      matrix |> printBoard();
      position = IO.gets("Input position (x, y): ")\
      |> String.trim()
      |> String.split(~r{,\s*}, trim: true)
      |> Enum.map(&String.to_integer/1);
      if length(position) != 2 do
        IO.puts("Invalid input, please enter two numbers");
        gameLoop(matrix, turn);
      else
        [x, y] = position;
        if x < 1 || x > 3 || y < 1 || y > 3 do
          IO.puts("Input value range must be from 1 to 3");
          gameLoop(matrix, turn);
        end
        if Enum.at(Enum.at(matrix, y - 1), x - 1) != 0 do
          IO.puts("This cell has been placed");
          gameLoop(matrix, turn);
        end
        matrix = List.update_at(matrix, y - 1, fn row ->
          List.update_at(row, x - 1, fn _ -> turn end)
        end);
        gameLoop(matrix, getReverseTurn(turn));
      end
    rescue
      e -> IO.puts("Caught an exception: #{e}")
    end
  end

  def main do
    matrix = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ];
    gameLoop(matrix, 1);
    # matrix |> printBoard
  end
end
