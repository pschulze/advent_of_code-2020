# frozen_string_literal: true

entries = File.readlines(File.join('fixtures', 'day_05.txt'))

seat_ids = entries.map do |entry|
  binary_string = entry.gsub('F', '0').gsub('B', '1').gsub('L', '0').gsub('R', '1')
  row_number = binary_string[0..6].to_i(2)
  column_number = binary_string[7..9].to_i(2)

  row_number * 8 + column_number
end

puts "Highest Seat ID: #{seat_ids.max}"

seat_ids.each do |seat_id|
  if seat_ids.include?(seat_id + 2) && !seat_ids.include?(seat_id + 1)
    puts "Your Seat ID: #{seat_id + 1}"
    break
  end
end
