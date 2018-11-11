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
  holiday_hash[:summer][:fourth_of_july][1]
  # return the second element in the 4th of July array
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season]= {holiday_name => supply_array}
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  list = []
  list.push(holiday_hash[:winter][:christmas])
  list.push(holiday_hash[:winter][:new_years])
  list.flatten!
  list
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each {|key, holiday_array|
    puts "#{key.capitalize}:"
    holiday_array.each{|holiday, array|
      things = ""
      array.each{|supply|
        things += supply
        things += ", "}
      last_index = (things.length) - 1
      penultimate_index = (things.length) - 2
      things.slice!(last_index)
      things.slice!(penultimate_index)
      holiday1 = holiday.to_s
      if holiday1.include?("_")
        temp_list = holiday1.split("_")
        temp_list.each{|x| x.capitalize!}
        holiday1 = temp_list.join(" ")
        puts "  #{holiday1}: #{things}"
      else
        puts "  #{holiday1.capitalize}: #{things}"
      end
    }}
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  list = []
  holiday_hash.each {|key, holiday_array|
  holiday_array.each{|holiday, array|
    if array.include?("BBQ")
      list.push(holiday)
    end}}
  return list
end
