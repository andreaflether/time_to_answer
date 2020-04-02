class Question < ApplicationRecord
  searchkick 
  
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  
  paginates_per 5

  scope :last_questions, ->(page) {
    includes(:answers, :subject).order('created_at desc').page(page)
  }

  scope :search_for, ->(term, page) {
    includes(:answers, :subject)
    .where("description LIKE ?", "%#{term.downcase}%")
    .page(page)
  }

  scope :search_for_subject, ->(subject_id, page) {
    includes(:answers, :subject)
    .where(subject_id: subject_id)
    .page(page)
  }

  # Callbacks 
  after_create :set_statistic

  private 

  def set_statistic 
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
  end 
end
