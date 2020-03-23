class Question < ApplicationRecord
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  
  paginates_per 5

  scope :last_questions, -> {
    includes(:answers, :subject).last(5)
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
end
