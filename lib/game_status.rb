# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS const
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  if(!board.include?("O") && !board.include?("X"))
    return false
  else
    WIN_COMBINATIONS.each do |win_combo|
      if (board[win_combo[0]] == "X") && (board[win_combo[1]] == "X") && (board[win_combo[2]] == "X")
        return win_combo
      elsif ((board[win_combo[0]] == "O") && (board[win_combo[1]] == "O") && (board[win_combo[2]] == "O"))
        return win_combo
      end
    end
  end
  return false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  if full?(board) && (won?(board) == false)
    true
  else
    false
  end
end

def over?(board)
  if (won?(board) != false || draw?(board))
    true
  else
    false
  end
end

def winner(board)
  win_combo = won?(board)
  puts win_combo
  if win_combo == false
    return nil
  elsif board[win_combo[0]] == "X"
    "X"
  elsif board[win_combo[0]] == "O"
    "O"
  end
end
