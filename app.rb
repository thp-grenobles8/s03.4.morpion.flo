require 'pry'
require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'json'
require 'pp'
require 'matrix'

require 'bundler'
Bundler.require

require_relative 'lib/app/board_case.rb'
require_relative 'lib/app/board.rb'
require_relative 'lib/app/game.rb'
require_relative 'lib/app/player.rb'
require_relative 'lib/view/show.rb'
require_relative 'lib/view/application.rb'
require_relative 'lib/view/ascii.rb'

Application.new(' ').start
