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
#

require 'test_helper'

class FlashcardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
