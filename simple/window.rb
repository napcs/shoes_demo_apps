# Window example

# - Brian Hogan

# normally, windows work like this:

# Shoes.app do
#   button "Open window" do
#     window :title => "Child" do
#       para "Hello!"
#     end
#   end
# end
# 
#
# but we may want to do a litle more
# like pass variables around.


Shoes.app :height=>100, :width=>300 do 
  button("Change name") { display_window }
  @name = para "Change the name"
  
  def display_window
    window :title => "Name", :width=>220,
           :height => 100 do
      para "Enter your name"
      @txt_name = edit_line
      button "OK" do
        owner.change_name(@txt_name.text)
        close
      end
      button("Cancel") { close }
    end
  end
  
  def change_name(name)
    @name.text = name
  end
  
end

