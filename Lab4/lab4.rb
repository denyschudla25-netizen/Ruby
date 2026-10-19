
# Лабораторна робота № 4
# Тема: Методи в мові Ruby

# Завдання 1. Аргументи за замовчуванням і перевизначення методів
def greet(name = "Студент")
  "Привіт, #{name}!"
end

def greet(name = "Студент")
  "Вітаю, #{name}! Це нова версія методу."
end

puts "\nЗавдання 1:"
puts greet
puts greet("Денис")

# Завдання 2. Іменовані параметри
def introduce(name:, age: nil, city: "Невідомо")
  result = "Ім'я: #{name}"
  result += ", вік: #{age}" unless age.nil?
  result += ", місто: #{city}"
  result
end

puts "\nЗавдання 2:"
puts introduce(name: "Денис", age: 20, city: "Кам'янець-Подільський")
puts introduce(name: "Олег")

# Завдання 3. Логічні (предикатні) методи
def even_number?(number)
  number.even?
end

puts "\nЗавдання 3:"
puts even_number?(8)
puts even_number?(5)

# Завдання 4. Методи-оператори та методи присвоювання
class NumberBox
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def +(other)
    NumberBox.new(@value + other.value)
  end

  def value=(new_value)
    @value = new_value
  end
end

puts "\nЗавдання 4:"
a = NumberBox.new(10)
b = NumberBox.new(5)
c = a + b
puts "Результат додавання: #{c.value}"
a.value = 20
puts "Нове значення a: #{a.value}"

# Завдання 5. Масив як аргумент і splat-оператор
def array_sum(numbers)
  numbers.sum
end

def arguments_count(*args)
  args.length
end

puts "\nЗавдання 5:"
puts "Сума елементів: #{array_sum([1, 2, 3, 4])}"
puts "Кількість аргументів: #{arguments_count(10, 20, 30)}"

# Завдання 6. Псевдонім методу
def say_hello
  "Привіт!"
end

alias greet_alias say_hello

puts "\nЗавдання 6:"
puts greet_alias

# Завдання 7. Передавання блоку як аргументу
def execute_block(value, &block)
  block.call(value)
end

puts "\nЗавдання 7:"
puts execute_block(5) { |n| n * n }

# Завдання 8. yield з аргументом і без нього
def run_without_argument
  yield
end

def run_with_argument(value)
  yield(value)
end

puts "\nЗавдання 8:"
puts run_without_argument { "Блок виконано без аргументів" }
puts run_with_argument(10) { |n| n * 2 }

# Захист методу від виклику без блоку
def safe_yield
  return "Блок не передано" unless block_given?

  yield
end

puts safe_yield

# Завдання 9. Proc без аргументів і з аргументом
simple_proc = Proc.new { "Виконано Proc без аргументів" }
number_proc = Proc.new { |a, b| "Сума: #{a.to_i + b.to_i}" }

puts "\nЗавдання 9:"
puts simple_proc.call
puts number_proc.call(3, 4, 5)
puts number_proc.call(3)

def proc_return_demo
  action = Proc.new { return "Proc виконав return із зовнішнього методу" }
  action.call
  "Цей рядок не виконається"
end

puts proc_return_demo

# Завдання 10. Lambda без аргументів і з аргументом
simple_lambda = -> { "Виконано lambda без аргументів" }
number_lambda = ->(a, b) { a + b }

puts "\nЗавдання 10:"
puts simple_lambda.call
puts "Сума: #{number_lambda.call(3, 4)}"

begin
  puts number_lambda.call(3)
rescue ArgumentError => e
  puts "Помилка lambda: #{e.message}"
end

def lambda_return_demo
  action = -> { return "Lambda повертає значення з самої lambda" }
  action.call
  "Зовнішній метод продовжив виконання"
end

puts lambda_return_demo

puts "\nУсі завдання виконано."
