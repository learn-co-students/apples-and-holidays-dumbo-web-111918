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
  
    holiday_hash[:winter].each do |key, value|
      holiday_hash[:winter][key] << supply
    end
end
  
 
def add_supply_to_memorial_day(holiday_hash, supply)
  
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  
  holiday_hash[season][holiday_name] = supply_array

end

def all_winter_holiday_supplies(holiday_hash)
  
      holiday_hash[:winter].values.flatten
      
  end
end

def all_supplies_in_holidays(holiday_hash)
  
  
  
  
  
  storage = []
  holiday_hash.each do |seasons, holidays|
    puts "#{seasons.to_s.capitalize}:"
    holiday_hash[seasons].each do |holidays, supplies|
     storage = holidays.to_s.split("_")
      storage.collect! {|item| item.capitalize!}
        puts "  #{storage.join(" ")}: #{supplies.join(", ")}"
      end
    end
  end
end
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

end

def all_holidays_with_bbq(holiday_hash)
  
  bbq_holidays_supl = []
  holiday_hash.each do |seasons, holidays|
    hash[seasons].each do |holidays, supplies|
      hash[seasons][holidays].each do |supplies|
        if supplies == "BBQ"
          bbq_holidays_supl << holidays
        end
      end
    end
  end
  bbq_holidays_supl
end
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

end







