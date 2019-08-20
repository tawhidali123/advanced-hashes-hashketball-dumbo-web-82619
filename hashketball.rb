# Write your code here!
require "pry"

def game_hash
  game = {
    
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [{
        name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      {
        name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7 
      },
      {
        name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15 
      },
      {
        name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5 
      },
      {
        name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1 
      }] 
    },
    
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [{
        name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2 
      },
      {
        name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10 
      },
      {
        name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5 
      },
      {
        name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0 
      },
      {
        name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12 
      }] 
    }
    
  }
end

def num_points_scored(player_name)
  holder = game_hash
  holder.each{
    |team, team_hash|
    team_hash[:players].each{
      |player|
      if player[:name] == player_name
        return player[:points]
      end
    }
  }
end

def shoe_size(player_name)
  holder = game_hash
  holder.each{
    |team, team_hash|
    team_hash[:players].each{
      |player|
      if player[:name] == player_name
        return player[:shoe]
      end
    }
  }
end

def team_colors(team_name)
  holder = game_hash
  holder.each{
    |team, team_hash|
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end
  }
end

def team_names 
  holder = game_hash
  name_holder = []
  holder.each{
    |team, team_hash|
    name_holder.push(team_hash[:team_name])
  }
  return name_holder
end

def player_numbers(team_name)
  holder = game_hash
  jersey_num = []
  holder.each{
    |team, team_hash|
    if team_hash[:team_name] == team_name
      team_hash[:players].each{
        |player|
        jersey_num.push(player[:number])
      }
    end
  }
  return jersey_num
end

def player_stats(player_name)
  holder = game_hash
  holder.each{
    |team, team_hash|
    team_hash[:players].each{
      |player|
      if player[:name] == player_name
         player.delete(:name)
         return player
      end
    }
  }
end

def big_shoe_rebounds
  holder = game_hash
  holder.each{
    |team, team_hash|
    team_hash[:players].each{
      |player|
      if player[:shoe] >= 18
        return player[:rebounds]
      end
    }
  }
end

def most_points_scored
  holder = game_hash
  holder.each{
    |team, team_hash|
    team_hash[:players].each{
      |player|
      if player[:points] >= 33
        return player[:name]
      end
    }
  }
end

def winning_team
  holder = game_hash
  total_points = 0
  home_team = 0
  teams_playing = []
  
  holder.each{
    |team, team_hash|
    teams_playing.push(team_hash[:team_name])
    team_hash[:players].each{
      |player|
      total_points += player[:points]
    }
    if team_hash[:team_name] == "Brooklyn Nets"
      team_hash[:players].each{
        |player|
        home_team += player[:points]
      }
    end
  }
  
  away_team = total_points - home_team
  
  if home_team > away_team
    return teams_playing[0]
  else teams_playing [1]
 end
  
end


def player_with_longest_name
  holder = game_hash
  longest_name = ""
  
  holder.each{
    |team, team_hash|
    team_hash[:players].each{
      |player|
      if player[:name].length > 14
        longest_name = player[:name]
      end
    }
  }
  return longest_name
end


def long_name_steals_a_ton? 
  holder = game_hash
  long_name = player_with_longest_name
  most_steals = ""
  
  
  holder.each{
    |team, team_hash|
    team_hash[:players].each{
      |player|
      if player[:steals] >= 22
        most_steals = player[:name]
      end
    }
  }
  
  long_name == most_steals
end










