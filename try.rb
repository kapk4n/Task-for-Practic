# frozen_string_literal: true

require 'date'

# class creating
class Test
  def initialize(periods, start)
    @periods_chain = periods
    @start_date = Date.parse(start)
  end

  def valid?
    k = 0

    current_date = @start_date
    a = checking(current_date, k)
    puts a[1] == @periods_chain.length
  end

  def add(new_period_type)
    k = 0
    fin = checking(@start_date, k)

    case new_period_type
    when 'annually'
      extra = fin[0]
      @periods_chain.push("#{extra.year}")
    when 'monthly'
      extra = fin[0]
      @periods_chain.push("#{extra.year}M#{extra.month}")
    when 'daily'
      extra = fin[0]
      @periods_chain = @periods_chain.push("#{extra.year}M#{extra.month}D#{extra.mday}")
    end

    [@periods_chain.to_s, @periods_chain]
  end

  private

  def checking(current_date, k)
    @periods_chain.each do |i|
      # checking year
      if i.match?(/\A\d*\z/) && i.to_i == current_date.year
        current_date = current_date.next_year
        k += 1
        next
      end

      # checking month
      if i.match?(/\A\d*M\d*\z/) && /\d*/.match(i).to_s.to_i == current_date.year && /M\d*/.match(i).to_s[1...3].to_i == current_date.month
        k += 1
        current_date += Date.civil(current_date.year, current_date.month + 1, -1).day.to_i
        next
      end

      # checking day
      next unless i.match?(/\A\d*M\d*D\d*\z/) && /\d*/.match(i).to_s.to_i == current_date.year &&
                  /M\d*/.match(i).to_s[1...3].to_i == current_date.month && /\d*\z/.match(i).to_s.to_i == current_date.mday

      current_date = current_date.next_day
      k += 1
      next
    end
    [current_date, k]
  end
end
