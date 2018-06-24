require 'pry'

holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

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
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
  return holiday_hash
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
  return holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = {holiday_name => supply_array}
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  new_array = []
  holiday_hash[:winter].each do |names, values|
      values.each do |amounts|
        new_array.push(amounts)
      end
    end
  return new_array
end

all_winter_holiday_supplies(holiday_supplies)

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holidays = []


  seasons = []
  new_holidays = []
  new_supplies = []

  holiday_hash.each do |names, values|
    names = names.capitalize
    seasons.push(names)
    values.each do |holiday, supplies|
      holiday = holiday.capitalize
      holidays.push(holiday)
      supplies.each do |amount|
        new_supplies.push(amount)
      end
    end
  end
  # Format the Holidays
  count = 0
  while count < holidays.size
    i = holidays[count].to_s
    i = i.tr('_', ' ')
    i = i.split.map(&:capitalize).join(' ')
    new_holidays.push(i)
    count += 1
  end
  # FINAL RETURN STRING

  puts seasons[0].to_s + ":\n" + "  " + new_holidays[0] + ": " + new_supplies[0] + ", " + new_supplies[1] + "\n" + "  " + new_holidays[1] + ": " + new_supplies[2] + "\n" + seasons[1].to_s + ":\n" + "  " + new_holidays[2] +  ": " + new_supplies[3] + ", " + new_supplies[4] + "\n" + seasons[2].to_s + ":\n" + "  " + new_holidays[3] +  ": " + new_supplies[5] + "\n" + seasons[3].to_s + ":\n" + "  " + new_holidays[4] +  ": " + new_supplies[6] + "\n"
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  new_array = []
  holiday_hash.each do |name, value|
    a = value.values[0]
    if a.include? 'BBQ'
      new_array.push(holiday_hash[name].keys)
    end
  end
  print new_array.flatten(1)
end

all_holidays_with_bbq(holiday_supplies)
