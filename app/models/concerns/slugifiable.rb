module Slugifiable
    def find_by_slug(slug)
        self.find_by(username: slug.split("-").join(" "))
    end

    module InstanceMethods
        def slug
            self.username.to_slug
        end
    end
end

class String
    def to_slug
        # self.scan(/[a-zA-Z ]+/).flatten.join.split(" ").join("-").downcase
        self.parameterize
    end
    def proper_titleize
        nocaps = ["and", "the", "to", "of", "by", "from", "or", "with", "a", "an"]
        self.split("-").collect {|w| nocaps.include?(w) ? w : w.capitalize }.join(" ")
    end
end