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
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_supplies[:winter][:christmas] << 'Balloons'
  holiday_supplies[:winter][:new_years] << "Balloons"


end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
holiday_supplies[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_supplies[season] = {holiday_name => supply_array}
holiday_supplies
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_supplies.each do |season, holiday|
      puts "#{season.capitalize}:"
      holiday.each do |holiday, supplies|
        holiday2 = holiday.to_s.split("_").map(&:capitalize).join(" ")
        puts "  #{holiday2}: " + supplies.join(", ")
      end
    end
  end	

def all_holidays_with_bbq(holiday_hash)
  bbq = []
  holiday_supplies.each do |season, holiday|
    holiday.each do |name, supply|
      if supply.include?("BBQ")
      bbq << name
    end
  end
end
  bbq
end
