class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @total_users = AdminStatistic.total_users.value
    @total_subjects = AdminStatistic.total_subjects.value
    @total_questions = AdminStatistic.total_questions.value
  end
end
