# displays time
# - Brian Hogan
Shoes.app :width => 200, :height => 200 do  
  @text_field = para Time.now.to_s  
  animate(1) do  
    @text_field.text =  Time.now.to_s  
  end
end