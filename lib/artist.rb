require 'pry'
require_relative './concerns/memorable.rb'
require_relative '../lib/concerns/findable'
require_relative '../lib/concerns/paramable'

class Artist
  attr_accessor :name
  attr_reader :songs
  extend Memorable 
  extend Findable
 include Paramable

  @@artists = []

@@ -11,22 +17,12 @@ def initialize
    @songs = []
  end

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end


  def add_song(song)
    @songs << song
    song.artist = self
@@ -36,7 +32,5 @@ def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end

end