module ApplicationHelper
    def readable_datetime(datetime)
        if datetime
            datetime.strftime("%Y/%m/%d/%H:%M")
        else
            "-/-/-/-:-"
        end
    end
    
    def from_now(datetime)
        if datetime == nil
            "-/-/--:--"
        else
            if datetime.to_s.include?("T") #DateTimeの表記方法の違いで分岐
                past_time = datetime.to_i - DateTime.now.to_i
            else
                past_time = datetime - DateTime.now#現在から何秒後
            end
            
            if 0 < past_time
                anterior_word = "あと"
                posterior_word = ""
            else
                anterior_word = ""
                posterior_word = "前"
            end

            difference = past_time.abs #絶対値
            minute = difference/60
            hour = minute/60
            day = hour/24
            week = day/7
            month = week/4
            year = day/365

            if (minute).to_i < 60#60分未満
                anterior_word + "#{minute.to_i }分" + posterior_word
            elsif hour.to_i < 24 #24時間未満
                anterior_word + "#{hour.to_i }時間" + posterior_word
            elsif day.to_i < 7 #７日未満
                anterior_word + "#{day.to_i}日" + posterior_word
            elsif week.to_i < 4 #4週間未満
                anterior_word + "#{week.to_i }週間" + posterior_word
            elsif  month.to_i < 12 #12ヶ月未満s
                anterior_word + "#{month.to_i }ヶ月" + posterior_word
            else
                anterior_word + "#{year.to_i}年" + posterior_word
            end
        end
    end
end
