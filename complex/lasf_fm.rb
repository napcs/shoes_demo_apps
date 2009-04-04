# Last.FM top tracks by user
# - Brian Hogan
Shoes.setup do
  gem "scrobbler"
end

require'scrobbler'

Shoes.app :title => "LastFM" do
  
  flow do
    para "LastFM Username"
    @username = edit_line
    button "search" do
      get_tracks(@username.text)
    end
  end
  
  @tracks = stack
  
  def get_tracks(username)
  
    user = Scrobbler::User.new(username)
    @tracks.clear do
      user.top_tracks[0..9].each do |t| 
        para "#{t.artist} - #{t.name} (#{t.playcount})" 
      end
    end
  end
end