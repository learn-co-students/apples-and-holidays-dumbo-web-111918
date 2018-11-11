require 'pry'


def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter].each do |holiday, value|
    value.push(supply)
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  holiday_hash[:spring][:memorial_day].push(supply)

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash.each do |time, holiday|
    if time == season
      holiday_hash[time] = {holiday_name => supply_array}
    end
  end

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday_data|
    #binding.pry
    puts "#{season.to_s.capitalize}:"
    holiday_data.each do |holiday, info|
      holiday_as_string = holiday.to_s
      if holiday_as_string.include?('_')
        temp_word = holiday_as_string.split('_')
        temp_word = temp_word.map do |word|
          word.capitalize
        end
        holiday_as_string_full = temp_word.join(' ')
        puts "  #{holiday_as_string_full}: " + info.join(', ')
      else
      puts "  #{holiday_as_string.capitalize}: " + info.join(', ')
      end
    end
  end
end


def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_bbqs = []
  holiday_hash.each do |season, holiday_data|
    holiday_data.each do |holiday, info|
      if info.include?("BBQ")
        holiday_bbqs.push(holiday)
      end
    end
  end
  holiday_bbqs
end
