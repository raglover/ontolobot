require 'sinatra'
require 'ostruct'
require 'pathname'

# Load Environment Settings

Config = OpenStruct.new
Config.env = ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development
Config.root = Pathname.new(File.expand_path('../..', __FILE__))

# Load Dependencies

require 'bundler'
Bundler.require(:default, Config.env)

