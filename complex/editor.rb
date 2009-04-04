# Simple text editor using Shoes
# - Brian Hogan
Shoes.app :title=>"Simple editor", :width=>800, :height => 600 do
  background(gray(0.5))
  flow do
    stack :width=>"100%", :height => 50 do
      flow do
        button "Open" do
          file = ask_open_file
          if file
             @editor.text = get_file_as_string(file)   
          end
        end
        button "Save" do
          save_file =  ask_save_file
          if save_file
            put_file_from_string save_file, @editor.text
          end
        end
      end
    end
  end
  flow do
    stack :width=>"100%", :height=>500 do
      @editor = edit_box "", :width=>"100%", :height=>"500"
    end
  end

  def get_file_as_string(filename)
    File.read(filename)
  end

  def put_file_from_string(filename, string)
    File.open(filename , 'w') do |file|
        file.puts(string)
    end
  end
end