class Activity < ApplicationRecord
  belongs_to :user

  scope :exist_lesson, ->lesson_id, user_id do
    where "target_id = ? and target_type = 0 and user_id = ?", lesson_id,
      user_id
  end
  scope :order_date_desc, ->{order created_at: :desc}
  scope :filter_user, ->user_id {where user_id: user_id}

  class << self
    def add_lesson_activity(lesson, current_user)
      target_action ="#{current_user.name} #{I18n.t "learning"} #{lesson.name}"
      Activity.create!(target_id: lesson.id, target_type: 0,
        target_action: target_action, user_id: current_user.id)
    end

    def add_follow_activity(user, current_user)
      target_action ="#{current_user.name} #{I18n.t "follow"} #{user.name}"
      Activity.create!(target_id: user.id, target_type: 1,
        target_action: target_action, user_id: current_user.id)
    end

    def add_unfollow_activity(user, current_user)
      target_action ="#{current_user.name} #{I18n.t "unfollow"} #{user.name}"
      Activity.create!(target_id: user.id, target_type: 1,
        target_action: target_action, user_id: current_user.id)
    end
  end
end
