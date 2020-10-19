class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :summary, length: { maximum: 250 }
    validates :context, length: { minimum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates_with TitleValidator
end
