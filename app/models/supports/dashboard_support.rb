class Supports::DashboardSupport
  def initialize
  end

  def new_user
    User.where(created_at: DateTime.now.beginning_of_month..DateTime.now).count
  end

  def total_online
    User.where(current_sign_in_at: 30.minutes.ago..DateTime.now).count
  end

  def no_of_visits
    User.count - User.where(current_sign_in_at:
      DateTime.now.beginning_of_month..DateTime.now).count
  end

  def feedbacks
    Report.count
  end

  def posts
    Question.where(updated_at: DateTime.now.beginning_of_month..DateTime.now)
      .count
  end

  def graph_posts
    Question.group_by_month(:updated_at)
  end

  def graph_line_users
    User.group_by_day(:current_sign_in_at)
  end

  def graph_pie_users
    online = User.where(current_sign_in_at:
      DateTime.now.beginning_of_month..DateTime.now).count
    not_online = User.count - online
    [["User::Online", online], ["User::Not Online", not_online]]
  end
end
