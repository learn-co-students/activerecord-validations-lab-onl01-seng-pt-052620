class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait_title

    def clickbait_title
        clickbait = ["Won't Believe", "Secret", "Top #{/\d/}", "Guess"]
        if !title.nil?
            errors.add(:title, 'Title is not clickbaity enough!') unless clickbait.any? { |c| title.include?(c) }
        end
    end
end
