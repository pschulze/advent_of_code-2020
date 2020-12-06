# frozen_string_literal: true

required_fields = %w[byr iyr eyr hgt hcl ecl pid]
rough_valid_entries_count = 0

rigorous_valid_entries_count = File.read(File.join('fixtures', 'day_04.txt')).split("\n\n").select do |entry|
  found_fields = entry.gsub("\n", ' ').split(' ').map { |sub_entry| sub_entry.split(':') }.to_h

  missing_fields = required_fields - found_fields.keys
  next false unless missing_fields.empty?

  rough_valid_entries_count += 1

  next false unless found_fields['byr'].to_i.between?(1920, 2002)
  next false unless found_fields['iyr'].to_i.between?(2010, 2020)
  next false unless found_fields['eyr'].to_i.between?(2020, 2030)

  height, unit = found_fields['hgt'].scan(/(\d+)(\w+)/).first
  next false unless (height.to_i.between?(150, 193) && unit == 'cm') || (height.to_i.between?(59, 76) && unit == 'in')

  next false unless found_fields['hcl']&.match?(/^#[[a-f][0-9]]{6}$/)
  next false unless %w[amb blu brn gry grn hzl oth].include?(found_fields['ecl'])
  next false unless found_fields['pid']&.match?(/^[0-9]{9}$/)

  true
end.count

puts "Valid Entries (Rough): #{rough_valid_entries_count}"
puts "Valid Entries (Rigorous) #{rigorous_valid_entries_count}"
