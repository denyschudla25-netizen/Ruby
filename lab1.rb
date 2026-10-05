# Лабораторна робота №1
# Тема: Вступ до Ruby, масиви та ітератори
# Варіант 26


# ============================================================
# Завдання 1
# Обчислити площу ромба за двома діагоналями
# Формула: S = (d1 * d2) / 2
# ============================================================

UNIT = "см"

d1 = 10
d2 = 8

area = (d1 * d2) / 2

puts "========================================"
puts "ЗАВДАННЯ 1"
puts "========================================"

puts "Перша діагональ: #{d1} #{UNIT}"
puts "Друга діагональ: #{d2} #{UNIT}"
puts "Площа ромба: #{area} #{UNIT}²"


# ============================================================
# Завдання 2
# Із масиву слів вибрати паліндроми
# ============================================================

words = [
  "level",
  "hello",
  "radar",
  "ruby",
  "madam",
  "world",
  "топот",
  "apple"
]

palindromes = words.select do |word|
  word == word.reverse
end

puts
puts "========================================"
puts "ЗАВДАННЯ 2"
puts "========================================"

puts "Початковий масив:"
p words

puts "Паліндроми:"
p palindromes


# ============================================================
# Завдання 3
# Замінити елементи масиву за умовою
# Два способи:
# 1. map + if/else
# 2. map + тернарний оператор
# ============================================================

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Спосіб 1 — map + if/else
result_if = numbers.map do |number|
  if number.even?
    number * 2
  else
    number
  end
end

# Спосіб 2 — map + тернарний оператор
result_ternary = numbers.map do |number|
  number.even? ? number * 2 : number
end

puts
puts "========================================"
puts "ЗАВДАННЯ 3"
puts "========================================"

puts "Початковий масив:"
p numbers

puts "Результат через map + if/else:"
p result_if

puts "Результат через map + тернарний оператор:"
p result_ternary


# ============================================================
# Завдання 4
# Масив відвідувань веб-сайту
#
# Знайти:
# 1. Загальну кількість переглянутих сторінок
# 2. Згрупувати відвідування за браузером
# ============================================================

visits = [
  {
    ip: "192.168.1.1",
    pages_viewed: 5,
    user_agent: "Chrome"
  },
  {
    ip: "192.168.1.2",
    pages_viewed: 3,
    user_agent: "Firefox"
  },
  {
    ip: "192.168.1.3",
    pages_viewed: 7,
    user_agent: "Chrome"
  },
  {
    ip: "192.168.1.4",
    pages_viewed: 2,
    user_agent: "Edge"
  },
  {
    ip: "192.168.1.5",
    pages_viewed: 4,
    user_agent: "Firefox"
  },
  {
    ip: "192.168.1.6",
    pages_viewed: 6,
    user_agent: "Chrome"
  }
]

total_pages = visits.sum do |visit|
  visit[:pages_viewed]
end

visits_by_browser = visits.group_by do |visit|
  visit[:user_agent]
end

puts
puts "========================================"
puts "ЗАВДАННЯ 4"
puts "========================================"

puts "Загальна кількість переглянутих сторінок:"
puts total_pages

puts
puts "Відвідування за браузерами:"

visits_by_browser.each do |browser, browser_visits|
  puts "#{browser}: #{browser_visits.length} відвідувань"
end