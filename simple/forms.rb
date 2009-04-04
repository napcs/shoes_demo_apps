# simple app to demonstrate
# the various form controls.

# - Brian Hogan

Shoes.app :title => "Forms" do
  
  stack do
    para "Name"
    edit_line
    
    para "SSN"
    edit_line :secret => true
    
    para "About"
    edit_box
    
    para "Eye color"
    list_box :items => ["Blue", "Green", "Brown", "Hazel"]
  end
  
  stack do
    
    flow do
      radio
      para "male"
      radio
      para "female"
    end
  end
  
  stack do
    flow do
      para "Do you like me?"
      para "yes"
      check
      para "no"
      check
    end
  end
end









