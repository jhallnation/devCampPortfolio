module DefaultPageContent
  extend ActiveSupport::Concern

  included do
   before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title ='JHallNation| My Portfolio Site'
    @seo_keywords = 'Jason Hall portfolio'
  end

end