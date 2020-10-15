class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        sorted = self.posts.sort_by(&:created_at)
        top_5 = []
        sorted[0..4].each do |obj|
        top_5 << obj
        end
        top_5
    end

    def featured_post
        self.posts.max_by{|post| post.likes}
    end

    def avg_age
        ages = self.bloggers.map {|blogger| blogger.age}
        avg = ages.sum / ages.length
    end

end
