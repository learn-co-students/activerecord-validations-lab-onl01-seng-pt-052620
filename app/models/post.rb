class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :summary, length: { maximum: 250 }
    validates :content, length: { minimum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_clickbait

    def title_clickbait
        if title && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "Must contain clickbait.")
        end
    end
end
