class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.match?("Won't Believe") || record.title.match?("Secret") || record.title.match?("Top [number]") || record.title.match?("Guess")
            record.errors[:title] << "Title must contain Won't Believe, Secret, Top [number], or Guess"
        end
    end
end 