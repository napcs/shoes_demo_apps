# Simple  mp3 player
#
# - Brian Hogan
Shoes.app :title => "MP3Shoes", :height => 600 do
  
  start do
    load_interface
  end

  flow :height => 50, :width => "100%" do
    button("Load") {load_interface}
    button("Play / Pause") { @player.pause }
    button("Stop") { @player.stop }
  end  
  
  @songlist = stack :height => 500, :width => "100%", :scroll => true

  @player_frame = flow :height=>50

  def load_interface
    songs = ask_open_folder
    if songs.nil?
      alert "You need to choose a folder"
    else
      files = Dir.glob("#{songs}/**/*.mp3")

      @songlist.clear do
        files.each do |file|
          flow do  
            button("Play") { play_file(file) }
            para file.gsub(songs, ""), :size => 8
          end # flow
        end # files
      end #songlist
    end #if
  end #load interface

  def play_file(file)

    
    @player_frame.clear do
      @player.stop unless @player.nil?
      @player = video file, :autoplay => true
    end
  end

end




