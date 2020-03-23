class Site::WelcomeController < SiteController
  def index
    @questions = Question.includes(:answers).last(3)
    @subjects = Subject.last(10)
  end
end
