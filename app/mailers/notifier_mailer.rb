class NotifierMailer < ApplicationMailer
  def email_friend(article, sender_name, receiver_email)

    @article = article
    @sender_name = sender_name
    puts 'hi there me'

    mail :to => receiver_email, :subject => 'Interesting Article'
  end
end

