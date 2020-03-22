class Site::SearchController < SiteController
  def questions 
    params[:term] ? @questions = Question.search_for(params[:term], params[:page]) : @questions = Question.last_questions
  end
end
