# Simple dialogs
# - Brian Hogan
Shoes.app do

  button("Open file") { ask_open_file }
  button("Open folder") { ask_open_folder }
  button("Save file") { ask_save_file }
  button("Color") { ask_color "#fff"}
  
  stack do
    @e = edit_box
    flow do
      button("Put on clipboard") { clipboard = @e.text}
      button("Put from clipboard") { @e.text = clipboard }
    end
  end
  
end
