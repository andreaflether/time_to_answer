class Site::SearchController < SiteController
  def questions 
    if params[:term]
      @questions = Question.search_for(params[:term], params[:page]) 
    else
      @questions = Question.last_questions
    end 
  end

  def subject
    @questions = Question.search_for_subject(params[:subject_id], params[:page])
  end 
end
