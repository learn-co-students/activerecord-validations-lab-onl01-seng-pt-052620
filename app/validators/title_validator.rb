# class TitleValidator < ActiveModel::Validator
#   def validate(record)
#     unless record.title.match?(/Won't Believe Top [number] Guess/)
#       record.errors[:title] << "We're only allowed to have people who work for the company in the database!"
#     end
#   end
# end