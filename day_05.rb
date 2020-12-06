# frozen_string_literal: true

entries = File.readlines(File.join('fixtures', 'day_05.txt'))

seat_ids = entries.map do |entry|
  binary_string = entry.gsub(/[FL]/, '0').gsub(/[BR]/, '1')
  row_number = binary_string[0..6].to_i(2)
  column_number = binary_string[7..9].to_i(2)

  row_number * 8 + column_number
end

puts "Highest Seat ID: #{seat_ids.max}"

your_seat_id = seat_ids.find do |seat_id|
  seat_ids.include?(seat_id + 2) && !seat_ids.include?(seat_id + 1)
end

puts "Your Seat ID: #{your_seat_id + 1}"
