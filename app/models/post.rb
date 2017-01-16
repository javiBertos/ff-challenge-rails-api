class Post < ApplicationRecord
  before_validation :sanitize_data, :on => [:create, :update]

  validates :title, presence: true
  validates :content, presence: true

  private
    def sanitize_data
      self.title     = sanitize(self.title)
      self.content   = sanitize(self.content)
      self.image_url = sanitize(self.image_url)
    end

    def sanitize(field)
      ActionController::Base.helpers.sanitize(field,
                                              :tags => %w(a b i strong em p param h1 h2 h3 h4 h5 h6 br hr ul li img),
                                              :attributes => %w(href name src type value width height data) );
    end
end
