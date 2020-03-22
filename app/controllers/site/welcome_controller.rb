class Site::WelcomeController < SiteController
  def index
    @questions = Question.includes(:answers).last(3)
  end
end
