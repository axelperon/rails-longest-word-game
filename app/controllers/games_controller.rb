class GamesController < ApplicationController
  require "json"
require "open-uri"
  def new
    alphabet = ("a".."z").to_a
    grid = []
    10.times do
      grid << alphabet.sample
    end
    @letters = grid
  end

  def score
    @letters = params[:letters].split(' ')
    @words = params[:words].downcase
    url = "https://dictionary.lewagon.com/#{@words}"
    urlword = URI.parse(url).read
    userword = JSON.parse(urlword)
    @words.chars.all? { |letter| @words.count(letter) <= @letters.count(letter) }
    if userword["found"] && @words.chars.all? { |letter| @words.count(letter) <= @letters.count(letter) }
       @response = "win"
    else
      @response = "lose"
    end
  end

end
