class NotifierMailer < ApplicationMailer
  default from: 'joescf@gmail.com'

  def email_friend(article, sender_name, receiver_email, greeting)
    @greeting = 'Hi'
    @article = article
    @sender_name = sender_name

    attachments['enterprise.png'] = File.read(Rails.root.join('public/images/enterprise-orig.jpg'))
    mail :to => receiver_email, :subject => 'Interesting Article'
  end

  def comment_added(comment)
    @article = comment.article
    mail :to => @article.user.email, :subject => "New comment for '#{@article.title}'"
  end
end

