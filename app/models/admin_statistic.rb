class AdminStatistic < ApplicationRecord
  EVENTS = {
    total_users: "TOTAL_USERS",
    total_subjects: "TOTAL_SUBJECTS",
    total_questions: "TOTAL_QUESTIONS"
  }

  # Scopes 
  scope :total_users, -> {
    find_by_event(EVENTS[:total_users])
  }

  scope :total_subjects, -> {
    find_by_event(EVENTS[:total_subjects])
  }

  scope :total_questions, -> {
    find_by_event(EVENTS[:total_questions])
  }

  def self.set_event(event)
    admin_statistic = AdminStatistic.find_or_create_by(event: event)
    admin_statistic.value += 1
    admin_statistic.save
  end 
end
