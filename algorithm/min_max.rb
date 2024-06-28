# 1
def min_max_sum number_array
  raise ArgumentError, "Array must contain exactly five integers." unless number_array.length == 5

  number_array.sort!

  "#{number_array[0..3].sum} #{number_array[1..4].sum}"
end

# 2
def min_max_sum_by_string
  loop do
    input_line = gets.chomp

    input_array = input_line.split(" ")

    if input_array.length != 5
      puts "Please enter 5 correct integers."
    else
      begin
        return min_max_sum(input_array.map(&:to_i))
      rescue ArgumentError
        puts "Please enter an integer."
      end
    end
  end
end

# 3
def sum_number_except str, number_except
  number_array = str.split(" ").map(&:to_i)

  raise ArgumentError, "Array must contain exactly five integers." unless number_array.length == 5

  (number_array - [number_except]).sum
end
