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

holiday_hash.each do |season, holiday|
  if season == :winter
    holiday.each do |name, gear|
      gear << supply
    end
  end
end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :spring
      holiday.each do |name, gear|
        if name == :memorial_day
          gear << supply
        end
      end
    end
  end

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)

  holiday_hash.each do |season_key,holiday_value|
    if season_key == season
      holiday_hash[season][holiday_name] = supply_array
    end
  end
end

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

def all_winter_holiday_supplies(holiday_hash)
  gear_array = []

  holiday_hash.each do |season_key, holiday_value|
    if season_key == :winter
      holiday_value.each do |holiday, gear|
        gear_array << gear
      end
    end
  end
  # return an array of allh of the supplies that are used in the winter season
gear_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday_a|
  puts "#{season.capitalize}:"
    holiday_a.each do |holiday_b, gear|
    puts "  #{holiday_b.to_s.split("_").map(&:capitalize).join(" ")}: #{gear.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  holiday_return = []
  holiday_hash.each do |season_value, holiday_value_a|
    holiday_value_a.each do |holiday_value_b, gear|
      if gear.include?("BBQ")
      holiday_return << holiday_value_b#to_s.split("_").map(&:capitalize).join(" ")
      end
    end
  end

holiday_return
end
