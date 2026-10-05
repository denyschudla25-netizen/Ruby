# Лабораторна робота №1
# Варіант 33

# Завдання 1
# Обчислити суму та добуток трьох дійсних чисел

a = 2.5
b = 4.0
c = -3.0

sum = a + b + c
product = a * b * c

puts "Завдання 1:"
puts "Числа: #{a}, #{b}, #{c}"
puts "Сума: #{sum}"
puts "Добуток: #{product}"

# Завдання 2
# Створити новий масив, який містить модуль кожного числа

numbers = [-5, 3, -8, 0, -2, 7]

absolute_numbers = numbers.map(&:abs)

puts "\nЗавдання 2:"
puts "Початковий масив: #{numbers.inspect}"
puts "Масив модулів: #{absolute_numbers.inspect}"

# Завдання 3
# Порахувати кількість чисел, більших за K
# Два способи: count та select + size

numbers_for_count = [2, 7, 10, 3, 15, 6, 20]
k = 6

count_method = numbers_for_count.count { |x| x > k }
select_method = numbers_for_count.select { |x| x > k }.size

puts "\nЗавдання 3:"
puts "Масив: #{numbers_for_count.inspect}"
puts "K = #{k}"
puts "Кількість через count: #{count_method}"
puts "Кількість через select + size: #{select_method}"

# Завдання 4
# Згрупувати замовлення за столиками
# та обчислити підсумковий чек для кожного столика

orders = [
  { table: 1, items: ["Pizza", "Cola"], total: 350 },
  { table: 2, items: ["Burger", "Juice"], total: 280 },
  { table: 1, items: ["Pasta", "Water"], total: 420 },
  { table: 3, items: ["Sushi", "Cola"], total: 550 },
  { table: 2, items: ["Pizza"], total: 300 }
]

total_by_table = orders.group_by { |order| order[:table] }
                        .transform_values { |table_orders| table_orders.sum { |order| order[:total] } }

puts "\nЗавдання 4:"
puts "Підсумковий чек для кожного столика:"

total_by_table.each do |table, total|
  puts "Столик #{table}: #{total} грн"
end