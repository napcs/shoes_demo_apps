# Simple app that manages a list
# of elements

# - Brian Hogan
Shoes.app do
  para "add name"
  @name = edit_line
  button "Add" do
    @names.append do
      para @name.text
    end
    @name.text = ""
  end
  
  button("Clear") {@names.clear}
  
  @names = stack :width=>"100%", 
                 :height=>"90%" 

end

