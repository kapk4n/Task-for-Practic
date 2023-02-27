# frozen_string_literal: true

require_relative 'try'

def check
  puts 'input periods, ex: 2020M1 2020 2021 2022 2023 2024M2 2024M3D30. You must enter space by space, no commas'
  a = gets
  puts 'input start date, ex: 30.01.2020'
  b = gets

  a = a.split(' ')

  test2 = Test.new(a, b)
  test2.valid?
end

def adding
  puts 'input periods, ex: 2020M1 2020 2021 2022 2023 2024M2 2024M3D30. You must enter space by space, no commas'
  a = gets
  puts 'input start date, ex: 30.01.2020'
  b = gets
  puts 'input type: one of the "daily", "monthly", "annually"'
  ty = gets
  ty = ty.chomp
  a = a.split(' ')

  test2 = Test.new(a, b)
  puts
  puts 'Result:'
  puts test2.add(ty)[0]

  test2 = Test.new(test2.add(ty)[1], b)
  test2.valid?
end

def start
  puts 'Choose what you want:'
  puts '1) check'
  puts '2) add'
  puts '0) exit'
end

start
a = gets

while a.to_i != 0
  if a.to_i == 1
    check
  elsif a.to_i == 2
    adding
  end
  start
  a = gets
  
end