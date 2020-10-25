class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, {:length => {:minimum => 250}})
  validates(:summary, {:length => {:maximum => 250}})
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  # validate :title_is_clickbate

    # def title_is_clickbate
    #   title_is_clickbate.includes?("Guess")
    # end
end
