class Landmark <ActiveRecord::Base
  belongs_to :figure

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    self.all.find {|figure| figure.slug == slug}
  end
end
