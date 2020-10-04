class TitleValidator < ActiveModel::Validator
    
    def validate(record)
        phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        unless !record.title.nil? && phrases.any? { |phrase| record.title.include? phrase }
            record.errors[:title] << "Not clickbait-y enough!"
        end
    end
end