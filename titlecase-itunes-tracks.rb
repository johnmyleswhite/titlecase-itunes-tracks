#!/usr/bin/macruby

# We iterate over every track, stripping bounding whitespace and putting things into proper title case.

require 'titlecase'

framework 'cocoa'

load_bridge_support_file 'ITunes.bridgesupport'

framework("ScriptingBridge")

itunes = SBApplication.applicationWithBundleIdentifier("com.apple.itunes")

music_playlist_tracks = itunes.sources.objectWithName("Library").userPlaylists.objectWithName("Music").fileTracks

music_playlist_tracks.each do |track|
  old_artist = track.artist
  new_artist = track.artist.strip.titlecase
  if old_artist != new_artist
    track.artist = new_artist
    puts "Artist: #{old_artist} => #{new_artist}"
  end
  
  old_album = track.album
  new_album = track.album.strip.titlecase
  if old_album != new_album
    track.album = new_album
    puts "Album: #{old_album} => #{new_album}"
  end
  
  old_name = track.name
  new_name = track.name.strip.titlecase
  if old_name != new_name
    track.name = new_name
    puts "Name: #{old_name} => #{new_name}"
  end
end
