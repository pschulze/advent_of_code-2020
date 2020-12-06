# frozen_string_literal: true

tree_map = File.readlines(File.join('fixtures', 'day_03.txt'), chomp: true).map(&:chars)

tree_map_height = tree_map.length
tree_map_length = tree_map.first.length

puts 'Trajectory - Trees Encountered'

result = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].map do |slope_info|
  horizontal_delta, vertical_delta = slope_info
  horizontal_position = 0
  vertical_position = 0
  trees_encountered = 0

  while vertical_position < tree_map_height
    trees_encountered += 1 if tree_map[vertical_position][horizontal_position] == '#'

    horizontal_position = (horizontal_position + horizontal_delta) % tree_map_length
    vertical_position += vertical_delta
  end

  puts "[#{horizontal_delta}, #{vertical_delta}] - #{trees_encountered}"

  trees_encountered
end.reduce(:*)

puts
puts "Product of Trees Encountered: #{result}"
