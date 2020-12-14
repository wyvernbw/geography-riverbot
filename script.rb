require 'selenium-webdriver'
require 'auto_click'
include AutoClickMethods

class Riverbot
  def initialize 
    puts "Riverbot v1.0.0 by wYvernBW on GitHub"
    puts "Make sure to never move the window on the screen!"
    puts "press enter to continue..."
    wait = gets
    @driver = Selenium::WebDriver.for :firefox
    @rivers = {
      # 37 total rivers. 4 to go 
      # name    position
      #         x    y   
      :siret => [697, 568],
      :prut => [749, 442],
      :motru => [364, 656],
      :bistrita => [606, 456],
      :cerna => [340, 656],
      :putna => [629, 560],
      :barzava => [274, 605],
      :buzau => [690, 645],
      :teleorman => [531, 716],
      :arges => [499, 647],
      :cdnm => [775, 732],
      :timis => [297, 582],
      :somes => [408, 415],
      :smsmic => [433, 465],
      :tarnavamica => [510, 508],
      :tarnavamare => [540, 524],
      :ialomita => [575, 675],
      :moldova => [614, 398],   
      :barcau => [345, 412],
      :trotus => [636, 511],
      :sulina => [853, 631],
      :olt => [589, 529],
      :prahova => [582,653],
      :smsmare => [477, 414],
      :jiu => [400, 682],
      :dambovita => [543, 646],
      :suceava => [616, 376],
      :barlad => [732, 493],
      :tisa => [468, 344],
      :lotru => [448, 615],
      :dunarea => [600, 776],
      :crisulalb => [344, 521],
      :crisulrepede => [342, 439],
      :vedea => [549, 766],
      :crisulnegru => [332, 480],
      :jijia => [668, 364],
      :chilia => [850, 602],
      :sfgheorghe => [852, 653],
      :mures => [557, 468],
      :bahlui => [682, 415],
      :calmatui => [716, 656],
      :cibin => [464, 572],
      :bega => [245, 571]
    }
    @y_mod = 0
    @x_mod = 0
    @click_delay = 0
  end

  def get_input
    puts "Input delay between clicks (seconds) : "
    @click_delay = gets.to_i
    puts "\nWhere is your taskbar (1 - top, 2 - bottom, 3 - left, 4 - right)?"
    taskbar_location = gets 
    taskbar_location = taskbar_location.to_i 
    if taskbar_location == 2 
      @y_mod = -20
    end
    if taskbar_location == 3 
      @x_mod = 57
      @y_mod = -20
    end
    if taskbar_location == 4 
      @x_mod = 57
      @y_mod = -20
    end
     
    puts "v1(not supported!) or v2? (1 - v1, 2 - v2)"
    @site_version = gets.to_i
  end

  def get_current_river(site_version, driver)
    if @site_version == 1 
      current_river = @intrebare.text
      current_river = current_river.partition(":").last.lstrip
    end
    
    if @site_version == 2 
      sleep 0.5
      current_river = @intrebare.text.gsub(/\A\p{Space}*/, '')
    end
    return current_river
  end
  def navigate_to_site
    if @site_version == 1 
      @driver.navigate.to "https://www.geogra.ro/joc/rauri/rauri.php"
      @intrebare = @driver.find_element(id: 'intrebare')
    end
    
    if @site_version == 2 
      @driver.navigate.to "https://www.geogra.ro/joc/ro/rorauri/index.php"
      @intrebare = @driver.find_element(id: 'intrebgenerat')
    end
  end

  def click_at(pos, y_mod, x_mod) 
    mouse_move(pos[0] + x_mod, pos[1] + y_mod)
    sleep 0.05
    left_click
  end
  
  def click_at_river(current_river, rivers)
    if current_river == "Râul Siret" 
      click_at(rivers[:siret], @y_mod, @x_mod)
    end

    if current_river == "Râul Bârlad" 
      click_at(rivers[:barlad], @y_mod, @x_mod)
    end

    if current_river == "Râul Bega" 
      click_at(rivers[:bega], @y_mod, @x_mod)
    end

    if current_river == "Râul Crișul Negru" 
      click_at(rivers[:crisulnegru], @y_mod, @x_mod)
    end

    if current_river == "Râul Crișul Repede" 
      click_at(rivers[:crisulrepede], @y_mod, @x_mod)
    end

    if current_river == "Râul Someșul Mare" 
      click_at(rivers[:smsmare], @y_mod, @x_mod)
    end

    if current_river == "Râul Trotuș" 
      click_at(rivers[:trotus], @y_mod, @x_mod)
    end
    if current_river == "Râul Mureș" 
      click_at(rivers[:mures], @y_mod, @x_mod)
    end

    if current_river == "Râul Prut" 
      click_at(rivers[:prut], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Lotru" 
      click_at(rivers[:lotru], @y_mod, @x_mod)
    end

    if current_river == "Râul Motru" 
      click_at(rivers[:motru], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Bistrița" 
      click_at(rivers[:bistrita], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Cerna" 
      click_at(rivers[:cerna], @y_mod, @x_mod)
    end
    
    if current_river == "Râul putna" 
      click_at(rivers[:putna], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Bârzava" 
      click_at(rivers[:barzava], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Buzău"
        click_at(rivers[:buzau], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Teleorman"
      click_at(rivers[:teleorman], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Argeș"
      click_at(rivers[:arges], @y_mod, @x_mod)
    end
    
    if current_river == "C. Dunăre-Marea Neagră"
      click_at(rivers[:cdnm], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Timiș"
      click_at(rivers[:timis], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Someș"
      click_at(rivers[:somes], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Someșul Mic"
      click_at(rivers[:smsmic], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Târnava Mică"
      click_at(rivers[:tarnavamica], @y_mod, @x_mod)
    end

    if current_river == "Râul Târnava Mare"
      click_at(rivers[:tarnavamare], @y_mod, @x_mod)
    end
  
    if current_river == "Râul Ialomița"
      click_at(rivers[:ialomita], @y_mod, @x_mod)
    end
    
    if current_river == "Brațul Sulina"
      click_at(rivers[:sulina], @y_mod, @x_mod)
    end

    if current_river == "Braţul Chilia" 
      click_at(rivers[:chilia], @y_mod, @x_mod)
    end
    
    # Brațul 
    # Braţul 
    if current_river == "Brațul Sfântu Gheorghe"
      click_at(rivers[:sfgheorghe], @y_mod, @x_mod)
    end
    
    if current_river == "Râul Vedea"
      click_at(rivers[:vedea], @y_mod, @x_mod)
    end

    if current_river == "Râul Jijia"
      click_at(rivers[:jijia], @y_mod, @x_mod)
    end

    if current_river == "Râul Jiu"
      click_at(rivers[:jiu], @y_mod, @x_mod)
    end

    if current_river == "Râul Prahova"
      click_at(rivers[:prahova], @y_mod, @x_mod)
    end

    if current_river == "Râul Dâmbovița"
      click_at(rivers[:dambovita], @y_mod, @x_mod)
    end

    if current_river == "Râul Bahlui"
      click_at(rivers[:bahlui], @y_mod, @x_mod)
    end

    if current_river == "Fluviul Dunărea"
      click_at(rivers[:dunarea], @y_mod, @x_mod)
    end

    if current_river == "Râul Cibin"
      click_at(rivers[:cibin], @y_mod, @x_mod)
    end

    if current_river == "Râul Suceava"
      click_at(rivers[:suceava], @y_mod, @x_mod)
    end

    if current_river == "Râul Tisa"
      click_at(rivers[:tisa], @y_mod, @x_mod)
    end

    if current_river == "Râul Călmățui"
      click_at(rivers[:calmatui], @y_mod, @x_mod)
    end

    if current_river == "Râul Barcău"
      click_at(rivers[:barcau], @y_mod, @x_mod)
    end

    if current_river == "Râul Crișul Alb"
      click_at(rivers[:crisulalb], @y_mod, @x_mod)
    end

    if current_river == "Râul Moldova"
      click_at(rivers[:moldova], @y_mod, @x_mod)
    end

    if current_river == "C. Dunăre-M.Neagră"
      click_at(rivers[:cdnm], @y_mod, @x_mod)
    end

    if current_river == "Râul Olt"
      click_at(rivers[:olt], @y_mod, @x_mod)
    end

  end
  
  def click_all_rivers
    i = 0
    while i < 42 do

      previous_river = ""
      current_river = get_current_river(@site_version, @driver)
      if i == 0
        previous_river = current_river 
      end
      if previous_river == current_river and i != 0
        i -= 1
      end

      sleep @click_delay 
      click_at_river(current_river, @rivers)
      
      puts current_river

      i += 1
      sleep 0.15
    end
  end
end

riverbot = Riverbot.new 
riverbot.get_input
riverbot.navigate_to_site
riverbot.click_all_rivers
