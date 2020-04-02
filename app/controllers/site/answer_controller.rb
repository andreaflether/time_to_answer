class Site::AnswerController < SiteController
  def question
    # @answer = Answer.find(params[:answer_id])
    redis_answer = Rails.cache.read(params[:answer_id]).split("@@")
    @question_id = redis_answer.first
    @correct = ActiveModel::Type::Boolean.new.cast(redis_answer.last)
    @answer_id = params[:answer_id]

    UserStatistic.set_statistic(@correct, current_user)   
  end 
end
