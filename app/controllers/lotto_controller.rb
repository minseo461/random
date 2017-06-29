class LottoController < ApplicationController
    
     def index
    
        require('open-uri')
        require('json')  
        
        @get_info = JSON.parse open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=').read
        
        @my_numbers = [*1..45].sample(6).sort
        @bonus_number = @get_info["bnusNo"]
        @drw_number = []
        @get_info.each do |k, v|
        @drw_number << v if k.include? 'drwtNo'
        
    end
    
    @drw_number.sort!
    
    @match_numbers = @drw_number & @my_numbers
    @match_cnt = @match_numbers.count

    
if @match_cnt == 6
        @result = '1등'
    elsif @match_cnt == 5 && @my_numbers.include?(@bonus_number)
        @result = '2등'
    elsif @match_cnt == 5
        @result = '3등'
    elsif @match_cnt == 4
        @result = '4등'
    elsif @match_cnt == 3
        @result = '5등'
    else
        @result = '꽝'
end
  end
end
