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
  return_value = ""
  holiday_hash.collect do |season, holiday|
    holiday.collect do |festivities, item|
      if festivities == :fourth_of_july
        return_value = item[1]
      end
    end
  end
  return_value
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.collect do |season, holiday|
    holiday.collect do |festivities, item|
      if festivities == :christmas || festivities == :new_years
        item << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.collect do |season, holiday|
    holiday.collect do |festivities, item|
      if festivities == :memorial_day
        item << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name]=supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_season_supply = Array.new
  holiday_hash[:winter].each do |festivities, item|
    item.each {|christmas_item| winter_season_supply << christmas_item}
  end
  return winter_season_supply
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    #seasons
    string_to_print = ""
    array_to_print = []
    string_to_print = season.to_s
    array_to_print = string_to_print.split("")
    array_to_print.delete_if {|value| value == ":"}
    string_to_print = ""
    array_to_print.each {|value| string_to_print << value}
    puts string_to_print.capitalize + ":"
      #festivities
    holiday.each do |festivities, item|
      string_to_print = ""
      array_to_print = []
      string_to_print = festivities.to_s
      array_to_print = string_to_print.split("")
      array_to_print.delete_if {|value| value == ":"}
      string_to_print = ""
      array_to_print.each {|value| string_to_print << value}
      array_to_print = []
      array_to_print = string_to_print.split("_")
      string_to_print = "  "
      counter = 0
      while counter < array_to_print.size-1
        string_to_print << array_to_print[counter].capitalize + " "
        counter += 1
      end
      string_to_print << array_to_print[counter].capitalize + ": "
      #supply
      string_to_print << item[0]
      counter = 1
      while counter < item.size
        string_to_print << ", " + item[counter]
        counter += 1
      end
      puts string_to_print
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  return_array = []
  holiday_hash.each do |season, holiday|
    holiday.each do |festivities, item|
      item.each do |supply|
        if supply == "BBQ"
          return_array << festivities
        end
      end
    end
  end
  return return_array
end
