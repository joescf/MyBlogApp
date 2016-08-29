class Comment < ApplicationRecord
  belongs_to :article

  validates :name, :email, :body, :presence => true
  validate :article_should_be_published

  after_create :email_article_author

  def article_should_be_published
    errors.add(:article_id, 'is not published yet') if article && !article.published?
  end

  # def after_create
  #   puts 'we will notify #{article.user.email} the author in chapter 9'
  # end
end
