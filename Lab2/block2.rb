
# Лабораторна робота № 2
# Блок 2. Варіант 33
# Завдання 9 і 10

# Завдання 9.
# Знайти добуток усіх додатних елементів матриці.

def positive_product_loop(matrix)
  product = 1
  found = false

  i = 0
  while i < matrix.length
    j = 0

    while j < matrix[i].length
      if matrix[i][j] > 0
        product *= matrix[i][j]
        found = true
      end

      j += 1
    end

    i += 1
  end

  found ? product : nil
end

def positive_product_iterator(matrix)
  positive = matrix.flatten.select { |number| number > 0 }

  positive.empty? ? nil : positive.inject(:*)
end

# Завдання 10.
# Знайти суму додатних елементів, більших за задану константу.

def positive_sum_loop(matrix, constant)
  sum = 0

  i = 0
  while i < matrix.length
    j = 0

    while j < matrix[i].length
      value = matrix[i][j]
      sum += value if value > 0 && value > constant

      j += 1
    end

    i += 1
  end

  sum
end

def positive_sum_iterator(matrix, constant)
  matrix.flatten
        .select { |value| value > 0 && value > constant }
        .sum
end

# Тестова матриця
matrix = [
  [2, -3, 5],
  [0, 4, -1],
  [6, -2, 3]
]

constant = 3

puts "Матриця:"
matrix.each { |row| puts row.inspect }

puts "\nЗавдання 9:"
puts "Спосіб 1 (while): #{positive_product_loop(matrix)}"
puts "Спосіб 2 (ітератор): #{positive_product_iterator(matrix)}"

puts "\nЗавдання 10:"
puts "Константа: #{constant}"
puts "Спосіб 1 (while): #{positive_sum_loop(matrix, constant)}"
puts "Спосіб 2 (ітератор): #{positive_sum_iterator(matrix, constant)}"
