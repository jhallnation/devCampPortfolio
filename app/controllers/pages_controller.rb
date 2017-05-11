class PagesController < ApplicationController
  def home
  	@posts = Blog.all
  	@skills = Skill.all
  end

  def contact
  end

  def about
  end
  
  def tech_news
    @tweets = SocialTool.twitter_search
  end

end
