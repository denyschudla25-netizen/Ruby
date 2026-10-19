
# Лабораторна робота № 3
# Варіант 33
# Склад інтернет-магазину електроніки

# Завдання 1. Створення хешу з 10 товарами
products = {
  "Ноутбук" => 8,
  "Смартфон" => 15,
  "Планшет" => 6,
  "Навушники" => 20,
  "Монітор" => 4,
  "Клавіатура" => 0,
  "Миша" => 12,
  "Принтер" => 3,
  "Колонки" => 7,
  "Вебкамера" => 2
}

puts "=== Лабораторна робота № 3 ==="
puts "Варіант 33: Склад інтернет-магазину електроніки"

puts "\nЗавдання 1. Початковий склад товарів:"
products.each do |name, quantity|
  puts "#{name}: #{quantity} шт."
end

# Завдання 2. Перетворення хешу на індексний масив
puts "\nЗавдання 2. Масив товарів:"
products_array = products.to_a

products_array.each_with_index do |product, index|
  puts "#{index}: #{product[0]} — #{product[1]} шт."
end

# Завдання 3. Сортування з вибором користувача
puts "\nЗавдання 3. Сортування товарів:"
puts "1 — за назвою товару"
puts "2 — за кількістю на складі"
print "Зробіть вибір (1 або 2): "

choice = gets&.strip

case choice
when "1"
  sorted_products = products.sort_by { |name, _quantity| name.downcase }
  puts "\nТовари, відсортовані за назвою:"
  sorted_products.each do |name, quantity|
    puts "#{name}: #{quantity} шт."
  end
when "2"
  sorted_products = products.sort_by { |_name, quantity| quantity }
  puts "\nТовари, відсортовані за кількістю:"
  sorted_products.each do |name, quantity|
    puts "#{name}: #{quantity} шт."
  end
else
  puts "Неправильний вибір. Сортування пропущено."
end

# Завдання 4. Три товари з найкоротшими назвами
puts "\nЗавдання 4. Три товари з найкоротшими назвами:"
shortest_names = products.sort_by { |name, _quantity| name.length }.first(3)

shortest_names.each do |name, quantity|
  puts "#{name} (довжина назви: #{name.length}, залишок: #{quantity} шт.)"
end

# Завдання 5. П'ять товарів із найменшим ненульовим залишком
puts "\nЗавдання 5. П'ять товарів із найменшим ненульовим залишком:"
lowest_stock = products
  .select { |_name, quantity| quantity > 0 }
  .sort_by { |_name, quantity| quantity }
  .first(5)

if lowest_stock.empty?
  puts "Немає товарів із ненульовим залишком."
else
  lowest_stock.each do |name, quantity|
    puts "#{name}: #{quantity} шт."
  end
end

# Завдання 6. Пошук товару за назвою
puts "\nЗавдання 6. Пошук товару:"
print "Введіть назву товару: "
search_name = gets&.strip

if search_name && products.key?(search_name)
  puts "Товар знайдено: #{search_name}."
  puts "Кількість на складі: #{products[search_name]} шт."
else
  puts "Товар із такою назвою не знайдено."
end

# Завдання 7. Загальна кількість одиниць товару
puts "\nЗавдання 7. Загальна кількість одиниць на складі:"
total_quantity = products.values.sum
puts "Усього на складі: #{total_quantity} шт."

# Завдання 8. Перевірка та оновлення нульових залишків
puts "\nЗавдання 8. Перевірка товарів із нульовим залишком:"

zero_stock_products = products.select do |_name, quantity|
  quantity == 0
end

if zero_stock_products.empty?
  puts "Товарів із нульовим залишком немає."
else
  zero_stock_products.each_key do |name|
    puts "Товар '#{name}' відсутній на складі."

    print "Введіть нову кількість для товару '#{name}': "
    input = gets&.strip

    if input && input.match?(/\A\d+\z/)
      products[name] = input.to_i
      puts "Залишок оновлено: #{name} — #{products[name]} шт."
    else
      puts "Некоректне значення. Залишок не змінено."
    end
  end
end

puts "\nПідсумковий стан складу:"
products.each do |name, quantity|
  puts "#{name}: #{quantity} шт."
end

puts "\nРоботу програми завершено."
