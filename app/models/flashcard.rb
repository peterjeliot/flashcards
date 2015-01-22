# == Schema Information
#
# Table name: flashcards
#
#  id         :integer          not null, primary key
#  question   :text             not null
#  answer     :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer          not null
#

class Flashcard < ActiveRecord::Base
  validates :question, :answer, :author_id, :subject_id, presence: true

  belongs_to :author,
      class_name: :User,
      foreign_key: :author_id,
      primary_key: :id

  belongs_to :subject

  def next
    subject.flashcards.where("id > ?", id).first
  end

  def prev
    subject.flashcards.where("id < ?", id).last
  end
end
