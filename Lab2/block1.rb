    
# Лабораторна робота № 2
# Блок 1. Варіант 33
# Завдання 3 і 4

# Завдання 3.
# Знайти всі індекси, на яких розташований максимальний елемент.

def max_indexes_loop(array)
  max_value = array.max
  indexes = []

  i = 0
  while i < array.length
    indexes << i if array[i] == max_value
    i += 1
  end

  indexes
end

def max_indexes_iterator(array)
  max_value = array.max

  array.each_with_index.filter_map do |value, index|
    index if value == max_value
  end
end

# Завдання 4.
# Елементи на парних позиціях перенести на початок,
# а елементи на непарних позиціях — у кінець.
# Позиції рахуємо від 1, як у формулюванні завдання.

def rearrange_loop(array)
  even_positions = []
  odd_positions = []

  i = 0
  while i < array.length
    if (i + 1).even?
      even_positions << array[i]
    else
      odd_positions << array[i]
    end

    i += 1
  end

  even_positions + odd_positions
end

def rearrange_iterator(array)
  even_positions = []
  odd_positions = []

  array.each_with_index do |value, index|
    if (index + 1).even?
      even_positions << value
    else
      odd_positions << value
    end
  end

  even_positions + odd_positions
end

# Перевірка роботи
numbers = [4, 9, 2, 9, 7, 1]

puts "Початковий масив: #{numbers}"

puts "\nЗавдання 3:"
puts "Спосіб 1 (цикл): #{max_indexes_loop(numbers)}"
puts "Спосіб 2 (ітератор): #{max_indexes_iterator(numbers)}"

puts "\nЗавдання 4:"
puts "Спосіб 1 (цикл): #{rearrange_loop(numbers)}"
puts "Спосіб 2 (ітератор): #{rearrange_iterator(numbers)}"
