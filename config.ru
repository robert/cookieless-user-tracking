require 'rubygems'
require 'bundler'
Bundler.require

require "rack/cache"

require './app'
run Sinatra::Application
