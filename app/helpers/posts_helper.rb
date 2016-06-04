module PostsHelper
  
  def my_post?
    @post.user == current_user ? true : false
  end

  def comments_any?
    @post.comments.count > 0 ? true :false
  end

  def find_my_post_comments
    @post.comments
  end
end
