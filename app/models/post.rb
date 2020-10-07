class Post < ActiveRecord::Base
    # include ActiveModel::Validations 
    # validates_with TitleValidator 
    
    validate :clickbait? 
    validates :title, presence: true, uniqueness: true 
    validates :content, {length: { minimum: 250 }}
    validates :summary, {length: { maximum: 250 }}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

     

    def clickbait? 
        valid_options = ["You Won't Believe These True Facts", "Secret", "Guess"] 
        if !valid_options.include?(self.title)    
            errors[:title] << "Has to be clickbait"
        end     
    end
end 
