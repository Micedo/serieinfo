require 'open-uri'

class SerieInfo
  def starta
    #if ARGV[0] == nil   # kollar om vi får argument från terminal
    #  serie = gets.chop
    #else
    #  serie = ARGV[0] # om argument finns tilldelar vi serie värdet
    #end
    
    serie = "dallas"

    serie.gsub!(/(\s)/){"%20"} # tar bort onödiga blanksteg som kan förstöra inputen
    serie.strip
    uri = URI.parse('http://www.tvrage.com/quickinfo.php?show=' + serie)
    serieinfo = uri.read

    ha = Hash.new('Ingen information tillgänglig') # ingen information värdet sätts om vi inte får någ$

    serieinfo.each do |line|
      key,value = line.split("@")
      ha[key] = value
    end

    # formatering till svenska
    ha["Next Episode"].to_s.gsub!(/(Feb)/){" Februari"}
    ha["Next Episode"].to_s.gsub!(/(Mar)/){" Mars"}
    ha["Next Episode"].to_s.gsub!(/(Apr)/){" April"}
    ha["Next Episode"].to_s.gsub!(/(May)/){" Maj"}
    ha["Next Episode"].to_s.gsub!(/(Jun)/){" Juni"}
    ha["Next Episode"].to_s.gsub!(/(Jul)/){" Juli"}
    ha["Next Episode"].to_s.gsub!(/(Aug)/){" Augusti"}
    ha["Next Episode"].to_s.gsub!(/(Sep)/){" September"}
    ha["Next Episode"].to_s.gsub!(/(Okt)/){" Oktober"}
    ha["Next Episode"].to_s.gsub!(/(Nov)/){" November"}
    ha["Next Episode"].to_s.gsub!(/(Dec)/){" December"}

    ha["Latest Episode"].to_s.gsub!(/(Feb)/){" Februari"}
    ha["Latest Episode"].to_s.gsub!(/(Mar)/){" Mars"}
    ha["Latest Episode"].to_s.gsub!(/(Apr)/){" April"}
    ha["Latest Episode"].to_s.gsub!(/(May)/){" Maj"}
    ha["Latest Episode"].to_s.gsub!(/(Jun)/){" Juni"}
    ha["Latest Episode"].to_s.gsub!(/(Jul)/){" Juli"}
    ha["Latest Episode"].to_s.gsub!(/(Aug)/){" Augusti"}
    ha["Latest Episode"].to_s.gsub!(/(Sep)/){" September"}
    ha["Latest Episode"].to_s.gsub!(/(Okt)/){" Oktober"}
    ha["Latest Episode"].to_s.gsub!(/(Nov)/){" November"}
    ha["Latest Episode"].to_s.gsub!(/(Dec)/){" December"}

    ha["Airtime"].to_s.gsub!(/(Monday)/){"Måndag"}
    ha["Airtime"].to_s.gsub!(/(Tuesday)/){"Tisdag"}
    ha["Airtime"].to_s.gsub!(/(Wednesday)/){"Onsdag"}
    ha["Airtime"].to_s.gsub!(/(Thursday)/){"Torsdag"}
    ha["Airtime"].to_s.gsub!(/(Friday)/){"Fredag"}
    ha["Airtime"].to_s.gsub!(/(Saturday)/){"Lördag"}
    ha["Airtime"].to_s.gsub!(/(Sunday)/){"Söndag"}
    ha["Airtime"].to_s.gsub!(/(Weekdays)/){" Vardagar"}

    puts "------------------------------------------------"
    puts " Serie --------- " + ha["Show Name"]
    puts " Premiär ------- " + ha["Premiered"]
    puts " Nästa avsnitt - " + ha["Next Episode"]
    puts " Senaste avsnitt " + ha["Latest Episode"]
    puts " Sändningstid -- " + ha["Airtime"]
    puts " Länk ---------- " + ha["Show URL"]
    puts " Genrerar ------ " + ha["Genres"]
    puts " Tv-bolag ------ " + ha["Network"]
    puts " Land ---------- " + ha["Country"]
    puts "------------------------------------------------"
  end
end

si = SerieInfo.new
si.starta
