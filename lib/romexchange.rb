require "romexchange/version"
require 'faraday'
require 'json'

module Romexchange
  class Error < StandardError; end

  DOMAIN = 'https://www.romexchange.com/api'

  WEAPON = 1
  OFFHAND = 2
  ARMOR = 3
  GARMENT = 4
  FOOTGEAR = 5

  class Item
    attr_accessor :name, :global, :sea
    def initialize(name: '', global: 0, sea: 0)
      @name = name.gsub('-', ' ')
      @global = global
      @sea = sea
    end

    def get
      response = Faraday.get "#{DOMAIN}?item=#{URI.encode(@name)}&slim=true"
      json = JSON.parse response.body
      json = json.first

      @global = json['global']['latest']
      @sea = json['sea']['latest']
    end

    def to_s
      @name
    end

    def self.get name
      item = Item.new(name: name)
      item.get
      item
    end

  end

  class Weapon < Item
    @@weapons = []
    def self.all
      return @@weapons unless @@weapons.empty?

      response = Faraday.get "#{DOMAIN}/items.json"
      json = JSON.parse response.body
      @@weapons = json.select do |j|
        j['type'] == WEAPON
      end.map do |m|
        Item.new name: m['name']
      end
    end
  end
  
  class Client
    def get item_name
      response = Faraday.get "#{DOMAIN}?item=#{URI.encode(item_name)}&slim=true"
      json = JSON.parse response.body
      json = json.first
      Item.new(name: json['name'], global: json['global']['latest'], sea: json['sea']['latest'])
    end
  end

  
end
