# class MyValidator < ActiveModel::Validator
#   def validate(post)
#     unless post.category == 'fiction' || 'non-fiction'
#       post.errors[:category] << 'Category must be fiction or non-fiction'
#     end
#   end
# end



class Post < ActiveRecord::Base
  validates :title, presence: true
  #validates :category, inclusion: { in: %w(fiction non-fiction)}
  validates :content, length: {minimum: 100}
  validate :category_must_be

    def category_must_be
      unless category == 'fiction' || 'non-fiction'
        errors[:category] << "must be fiction or non-fiction" 
      end
    end

end
