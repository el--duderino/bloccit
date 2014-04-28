class FavoriteMailer < ActionMailer::Base
  default from: "el_duderino@aol.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    headers["Message-ID"] = "<comments/#{@comment.id}@duders-bloccit.com"
    headers["In-Replay-To"] = "<comments/#{@post.id}@duders-bloccit.com"
    headers["References"] = "<comments/#{@post.id}@duders-bloccit.com"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
