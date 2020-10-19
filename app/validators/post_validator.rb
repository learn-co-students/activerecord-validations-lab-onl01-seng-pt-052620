class PostValidator < ActiveModel::Validator 
    def validate(record)
        if record.title
            reqs = ["Won't Believe", "Secret", "Top [number]", "Guess"]
            post.errors[:title] << "Message here"
        end
    end
end