# class CommentObserver < ActiveRecord::CommentObserver
#   def after_create(comment)
#     NotifierMailer.comment_added(comment).deliver
#   end
# end
