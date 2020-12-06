# frozen_string_literal: true

group_answers = File.read(File.join('fixtures', 'day_06.txt')).split("\n\n")

anyone_count = group_answers.map do |group_answer|
  group_answer.gsub("\n", '').chars.uniq.count
end.reduce(:+)

puts "Anyone in Group Yes Count: #{anyone_count}"

everyone_count = group_answers.map do |group_answer|
  group_answer.split("\n").map(&:chars).reduce { |common, answer| common.intersection(answer) }.count
end.reduce(:+)

puts "Everyone in Group Yes Count: #{everyone_count}"
