# Move a square with random color
# - Brian Hogan
Shoes.app :width => 200, :height => 200 do  

  @moving_box = rect 10, 10, 20, 20  
  @colors = [red, blue,yellow, green]
  animate(2) do  
    x = (0..width-20).rand  
    y = (0..height-20).rand  
    @moving_box.move x, y  
    @moving_box.fill = @colors[rand(@colors.length)]
    
  end  
end