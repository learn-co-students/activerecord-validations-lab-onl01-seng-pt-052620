class MyValidator < ActiveModel::Validator
    def validate(record)
      if record.title
        reqs = ["You Won't Believe These True Facts"]
        if reqs.detect {|el| record.title.include?(el) }.nil?
          record.errors[:title] << "Must contain clickbait"
        end
      end
    end
end 