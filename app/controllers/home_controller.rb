require 'open-uri'
class HomeController < ApplicationController
    def crawler
        

            url = "https://blog.naver.com/mardukas/221405729725"
            doc = Nokogiri::HTML(open(url, 'User-Agent' => 'chrome')) # 열고
            @post = doc.css("p[class = 'se_textarea']")
            @post.each do |post|
             tit = post.text


             @res = Result.new(name: tit)
             @res.save
             @pr = Result.all
        end
        @pr = Result.all
    end
    def index
        @pr  = Result.all
    end
    def show
         @pr = Result.all
    end
end



# require 'open-uri'
# class HomeController < ApplicationController
#     def crawler
#         (10).downto(1) do |c| #반복문을 돌면서
#             if c == 1
#                 addPage = ""
#             else
#                 addPage = "page#{c}/"
#             end
#             url = "https://search.shopping.naver.com/search/all.nhn?origQuery=%EC%98%81%EC%96%91%EC%A0%9C&pagingIndex=" + addPage # url을 지정해
            
#             doc = Nokogiri::HTML(open(url)) # 열고
#             @posts = doc.css('.goodslist ad _itemSection') 
#             @posts.each do |x| #각각 돌면서 Result에 추가해줍니다.
#                 tit = x.css('.tit').text.strip
#                 cont = x.css('.num _price_reload').integer.strip
#                 @res = Result.new(name: tit, content: cont)
#                 @res.save
#             end
#         end


#     end
#     def show
#         @pr = Result.all
#     end
# end