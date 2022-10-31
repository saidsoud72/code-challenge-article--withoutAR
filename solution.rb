# Please copy/paste all three classes into this file to submit your solution!

#### Article class ####

class Article
    attr_accessor :author, :magazine, :title

    @@all = []

    def initialize(author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end
end

#### Author class ####

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

#### Magazine class ####

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