class Site::SearchController < SiteController
  def questions 
    if params[:term]
      @questions = Question.includes(:answers, :subject)
                            .where("description LIKE ?", "%#{params[:term].downcase}%")
                            .page(params[:page]).per(5)
    else 
      @questions = Question.includes(:answers, :subject).last(5)
    end 
  end 
end
