require_relative './article'

class Author
  attr_accessor :name

  def initialize(name)
    @name = name
  
  end

  def articles
    #returns an array of Article instances the author has written
    Article.all.filter do |article|
      article.author = self
    end
  end

  def magazines
    magazines = self.articles.map do |article|
      article.magazine
    end
    #returns unique array Magazine instances for which the author has contributed to
    magazines.uniq
  end

  def add_article(magazine, title)
    #creates a new Article instance and associates it with that author and that magazine
    Article.new(title, self, magazine)
  end

  def topic_areas
    #returns a unique array of strings with the categories of the magazines the author has contributed to
    self.magazines.map do |magazine|
      magazine.category
    end
    magazines.uniq
  end

end
