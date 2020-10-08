class Post < ActiveRecord::Base

    include ActiveModel::Validations

    validates :title, presence: true
    validates :content, length: { minimum: 200 }
    validates :summary, length: { maximum: 200 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait_title

    def clickbait_title
        if title && !title.include?("Won't Believe" || "Secret" ||
          "Top [number]" || "Guess")
          errors.add(:title, "Must be clickbait-y")
        end
      end

    

    
end
