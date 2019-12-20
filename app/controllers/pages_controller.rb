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
    @tech_tweets = SocialTool.tech_search
    @ruby_tweets = SocialTool.ruby_search
    @js_tweets = SocialTool.js_search
  end

  # def jhall_dev
  # end

end
