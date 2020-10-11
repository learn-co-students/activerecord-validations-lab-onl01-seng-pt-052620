class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a category" }
  validate :is_clickbait?

  # Copying from solution. I personally hate Regexp, I want to write code that's actually readable
  # and regexp is a degenerate way of pattern matching if you don't want to memorize a second language entirely
  
  # "Debugging is twice as hard as writing the code in the first place. 
  # Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it."
  # --Brian Kernighan

  # "The competent programmer is fully aware of the limited size of his own skull. 
  # He therefore approaches his task with full humility, and avoids clever tricks like the plague."
  # --Edsger W. Dijkstra

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
