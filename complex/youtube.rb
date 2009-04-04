# Youtube Video Player
# - Brian Hogan
Shoes.setup do
  gem 'builder'
  gem 'xml-simple'
  gem 'youtube-g'
end
require 'youtube_g'
Shoes.app :title => "Videos", :width=> 820, :height => 600 do
  background "#333399".."#000000"
  stack :width=>"100%" do
    flow do
      @keyword = edit_line :margin_left => 20
      button "Search" do
        find_videos(@keyword.text)
      end
    end
  end

  stack :width=>"100%" do
    @videos = flow :width=>"100%"
  end
    
  def find_videos(keywords)
    client = YouTubeG::Client.new
    feed = client.videos_by :query => keywords, :per_page => 20
    videos = feed.videos
    if videos.length > 0
      display_thumbs(videos)
    else
      @videos.clear do
        para "There were no videos found."
      end
    end
  end
  
  def display_thumbs(videos)
    @videos.clear
    videos.each do |v|
      thumb = v.thumbnails.first.url
      @videos.append do
        i = image thumb, :margin_left => 10, :margin_top => 10, :height=>80, :width=>80
        i.click do
          display_video_info(v)
        end
      end
    end
  end
  
  def display_video_info(v)
    window :height => 640, :width => 480 do
      title v.title
      flow do
        v.thumbnails.each do |t|
          image t.url
        end
      end
      
      button "Play video" do
         visit v.embed_url
      end
      
      
    end
  end


end