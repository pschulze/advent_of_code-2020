# frozen_string_literal: true

entries = File.readlines(File.join('fixtures', 'day_01.txt')).map(&:to_i)

[2, 3].each do |n|
  entries.combination(n) { |combo| puts "#{n} Entry Answer: #{combo.reduce(:*)}" if combo.sum == 2020 }
end
