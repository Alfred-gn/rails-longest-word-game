class GamesController < ApplicationController

  def new
    @arrayalph = [('a'..'z').to_a[rand(26)],('a'..'z').to_a[rand(26)],('a'..'z').to_a[rand(26)],('a'..'z').to_a[rand(26)],('a'..'z').to_a[rand(26)],('a'..'z').to_a[rand(26)],('a'..'z').to_a[rand(26)]]

  end

  def score
    require "json"
require "open-uri"

url = "https://wagon-dictionary.herokuapp.com/#{params[:rep]}"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
    mess = 0
    arraylett =[]
    i = 0
    while i < params[:rep].length do
      arraylett << params[:rep][i]
      i += 1
    end
    arraylett.each do |l|
      if params[:lettre].include? l
        mess += 1
      else
        mess -= 1
      end
    end
    if mess == params[:rep].length
      @message = "c'est ok"
    else
      @message = "pas net"
    end
    if user["found"] == false
      @message = "pas net"
    end
  end
end
