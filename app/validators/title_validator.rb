class TitleValidator < ActiveModel::Validator

  
    def validate(record)
      unless record.title.match?("Won't Belive","Secret","Top [number]","Guess")
        record.errors[:title] << "Must have Wont Believe, Secret, Top [number], or Guess in title"
      end
    end
  end