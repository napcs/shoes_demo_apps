# Simple demonstration of pages with navbar
#
# - Brian Hogan
class Pages < Shoes
  
  url "/", :index
  url "/about", :about
  
  def navbar
    flow :width => "100%" do
      para link("Home", :click => "/"), " | "
      para link("About", :click => "/about")
    end
  end
  
  def index
    navbar
    para "Multiple pages"
  end
  
  def about
    navbar
    para "About this app"
  end

end

Shoes.app

