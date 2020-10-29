require "pry"

# def get_first_name_of_season_winner(data, season)
#   winner = ""
#   data.each do |season_number, contestants|
#     if season == season_number 
#       contestants.each do |contestant|
#         if contestant["status"] == "Winner"
#           winner = contestant["name"]
#         end
#       end 
#     end
#   end
#   winner.split(" ")[0]
# end

def get_first_name_of_season_winner(data, season)
  data[season].map do |contestant|
    if contestant["status"] == "Winner"
      return contestant["name"].split[0]
    end
  end
end


# def get_contestant_name(data, occupation)
#   data.map do |season, contestants|
#     contestants.map do |contestant|
#       if contestant["occupation"] == occupation
#         return contestant["name"]
#       end
#     end
#   end
# end

def get_contestant_name(data, occupation)
  data.map do |season, contestants|
    contestants.select do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end


def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.map do |season, contestants|
    contestants.map do |contestant|
      if hometown == contestant["hometown"]
        counter += 1
      end
    end
  end
  counter
end

# def count_contestants_by_hometown(data, hometown)
#   data.map do |season, contestants|
#     contestants.reduce do |counter, contestant|
#       if hometown == contestant["hometown"]
#         binding.pry
#         counter += 1
#       end
#       counter
#   end
# end

def get_occupation(data, hometown)
  data.map do |season, contestants|
    contestants.map do |contestant|
      if hometown == contestant["hometown"]
        return contestant["occupation"]
      end
    end
  end
end


# def get_average_age_for_season(data, season)
#   count = 0
#   total = 0
#   data[season].map do |contestant|
#     total += contestant["age"].to_f
#     count += 1
#   end
#   return (total / count).round
# end

def get_average_age_for_season(data, season)
  total = data[season].reduce(0) do |sum, contestant|
    sum += contestant["age"].to_f
  end
    (total / data[season].length).round
end
