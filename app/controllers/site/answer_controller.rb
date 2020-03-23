class Site::AnswerController < SiteController
  def question 
    puts "----------------------------"
    puts params[:answer]
  end 
end
