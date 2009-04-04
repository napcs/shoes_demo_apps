# keypresses
# - Brian Hogan

Shoes.app :width => 200, :height => 50 do
  @label = para "waiting for a keypress..."
  keypress do |key|
    @label.replace  case key
                    when :f1 
                       "The F1 key was pressed"
                       
                    when :f2
                      
                      ask_open_file
                      "Opened file dialog"
                    else
                      "the #{key.inspect} key was pressed"
                  end
  end
  
end
