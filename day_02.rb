# frozen_string_literal: true

entries = File.readlines(File.join('fixtures', 'day_02.txt'))

old_valid_password_count = 0
new_valid_password_count = 0

entries.each do |entry|
  temp = entry.split(' ')

  # 13-16 k: kkkkkgmkbvkkrskhd
  min, max = temp[0].split('-').map(&:to_i)
  letter = temp[1][0]
  password = temp[2]

  old_valid_password_count += 1 if password.count(letter).between?(min, max)

  first_index = min - 1
  second_index = max - 1

  new_valid_password_count += 1 if (password[first_index] == letter) != (password[second_index] == letter)
end

puts "Old Valid Passwords: #{old_valid_password_count}"
puts "New Valid Passwords: #{new_valid_password_count}"
