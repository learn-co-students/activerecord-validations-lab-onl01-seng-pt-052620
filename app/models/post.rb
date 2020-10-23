class Post < ActiveRecord::Base
 include ActiveModel::Validations
  validates :title, presence: true
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :summary, length: {maximum: 250}
  validates :content , length: {minimum:250 }
    validates_with MyValidator, on: :create

end
