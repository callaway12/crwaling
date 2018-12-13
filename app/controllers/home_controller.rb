require 'open-uri'
class HomeController < ApplicationController
    def crawler


            url = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%8A%A4%EC%8B%9C+%EB%A0%A4&oquery=%EB%85%B8%EC%BD%94%EA%B8%B0%EB%A6%AC+%ED%81%AC%EB%A1%A4%EB%A7%81&tqi=Ut42swpySEKssvkdf1GssssssB8-077335"
            doc = Nokogiri::HTML(open(url, 'User-Agent' => 'chrome')) # 열고
            @post = doc.css("div [id = 'sp_local_1']")
            @post.each do |post|
             tit = post.css("strong").text.strip
              # content = post.css("span")[0].text.strip 이게 뭐 파는지
              content = post.css("dd")[0].text.strip.split('<br>').slice(0)
              #dd tag [0] 은 주소 [1] 전화번호 [2] 운영시간 [3] 가격대


             @res = Result.new(name: tit, content: content)
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
