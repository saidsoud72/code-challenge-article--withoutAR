require_relative './article'

class Magazine
  attr_accessor :name, :category

  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def contributors
    #returns an array of Author instances who have written for this magazine
    articles_for_magazine.map do |filtered_article|
      filtered_article.author
    end
  end

  def self.find_by_name(magazine_name)
    #returns the first magazine object that matches
    Magazine.all.find do |magazine|
      magazine.name == magazine_name
    end
  end

  def article_titles
    #returns an array strings of the titles of all articles written for that magazine
    articles_for_magazine.map do |filtered_article|
      filtered_article.title
    end
  end

  def contributing_authors
    #returns an array of authors who have written more than 2 articles for the magazine
    self.contributors.filter do |author|
      author.articles.count > 2
    end
  end

  private

  #an alternative is to use self.
  def articles_for_magazine
    Article.all.filter do |article|
      article.magazine == self
    end
  end
end