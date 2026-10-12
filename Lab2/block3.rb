
# Лабораторна робота № 2
# Блок 3. Варіант 33
# Завдання 7 і 8

require "digest"
require "find"
require "json"

# Завдання 7, спосіб 1.
# Рекурсивний пошук через Find.find.

def duplicates_with_find(directory)
  hashes = Hash.new { |hash, key| hash[key] = [] }

  Find.find(directory) do |path|
    next unless File.file?(path)

    checksum = Digest::SHA256.file(path).hexdigest
    hashes[checksum] << path
  end

  hashes.values.select { |paths| paths.length > 1 }
end

# Завдання 7, спосіб 2.
# Рекурсивний пошук через Dir.glob.

def duplicates_with_glob(directory)
  hashes = Hash.new { |hash, key| hash[key] = [] }

  Dir.glob(File.join(directory, "**", "*")).each do |path|
    next unless File.file?(path)

    checksum = Digest::SHA256.file(path).hexdigest
    hashes[checksum] << path
  end

  hashes.values.select { |paths| paths.length > 1 }
end

def print_duplicates(groups)
  if groups.empty?
    puts "Однакових файлів не знайдено."
  else
    groups.each_with_index do |paths, index|
      puts "Група #{index + 1}:"
      paths.each { |path| puts "  #{path}" }
    end
  end
end

# Завдання 8.
# Шлях формується відносно розташування цього скрипту.

def read_json_with_join
  path = File.join(__dir__, "data", "input.json")
  JSON.parse(File.read(path))
end

# Другий спосіб формування абсолютного шляху.
def read_json_with_expand_path
  path = File.expand_path("data/input.json", __dir__)
  JSON.parse(File.read(path))
end

# Перевірка завдання 7
directory = File.join(__dir__, "test_files")
Dir.mkdir(directory) unless Dir.exist?(directory)

puts "Завдання 7: пошук однакових файлів"
puts "\nСпосіб 1 (Find.find):"
print_duplicates(duplicates_with_find(directory))

puts "\nСпосіб 2 (Dir.glob):"
print_duplicates(duplicates_with_glob(directory))

# Перевірка завдання 8
puts "\nЗавдання 8: читання JSON"

begin
  puts "Спосіб 1: #{read_json_with_join}"
  puts "Спосіб 2: #{read_json_with_expand_path}"
rescue Errno::ENOENT
  puts "Файл data/input.json не знайдено. Створи його за інструкцією."
rescue JSON::ParserError => error
  puts "Помилка формату JSON: #{error.message}"
end
