# frozen_string_literal: true

require_relative 'try'

def check(a, b)
  test2 = Test.new(a, b)
  test2.valid?
end

def adding(a, b)
  puts 'input type: one of the "daily", "monthly", "annually"'
  ty = gets
  ty = ty.chomp

  test2 = Test.new(a, b)
  puts
  puts 'Result:'
  resulting_expre = test2.add(ty)[0]

  [test2.valid?, resulting_expre]
end

def start
  puts 'Choose what you want:'
  puts '1) check'
  puts '2) add'
  puts '0) exit'
end

puts 'input periods, ex: 2020M1 2020 2021 2022 2023 2024M2 2024M3D30. You must enter space by space, no commas'
a_par = gets.split(' ')
puts 'input start date, ex: 30.01.2020'
b_par = gets

start
a = gets

while a.to_i != 0
  if a.to_i == 1
    puts check(a_par, b_par)
  elsif a.to_i == 2
    if check(a_par, b_par)
      added_result = adding(a_par, b_par)
      added_result[0]
      a_par = added_result[1]
      puts a_par.to_s
    else
      puts 'Input new chain, this is false'
    end
  end
  start
  a = gets
end
