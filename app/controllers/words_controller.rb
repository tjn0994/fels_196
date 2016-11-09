class WordsController < ApplicationController
  before_action :logged_in_user, only: :show

  def show
    @lesson = Lesson.includes(:words, :course).find_by_id params[:id]
    @words = @lesson.words.paginate page: params[:page],
      per_page: Settings.per_page.word
    exist_lesson = Activity.exist_lesson params[:id], current_user.id
    if exist_lesson.blank?
      Activity.add_lesson_activity @lesson, current_user
    end
  end
end
