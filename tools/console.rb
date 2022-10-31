require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###

#author
bonsai = Author.new("Bonsai CF")
jonah = Author.new("Yonah Stomachi Fishy")

#magazine
gamer = Magazine.new("eFootball 23", "Football Simulator")
fps = Magazine.new("PUBG", "FPS")
fifa = Magazine.new("FIFA", "Football Arcade")
ruby = Magazine.new("Ruby", "OOP Language")

#article
article1 = Article.new(bonsai, gamer, "What's new in the v2.1.1 update")
article2 = Article.new(bonsai, fps, "New partnership with Lionel Messi?")
article3 = Article.new(jonah, fifa, "Same game as last year's game, just a tad bit more expensive")
article4 = Article.new(bonsai, ruby, "It gets better and better - SQL and more!")





### DO NOT REMOVE THIS
binding.pry

0
