module FlashcardsHelper

	def get_prev(flashcard)
		flash_hash = Flashcard.all.map.with_index.to_a.to_h
		flash_hash.delete_if {|key,val| key.subject_id != flashcard.subject_id }

		index = flash_hash[flashcard]
		flash_hash.delete_if {|key,val| val >= index}

		return flashcard if flash_hash.empty?
		return flash_hash.keys.last;
	end

	def get_next(flashcard)
		flash_hash = Flashcard.all.map.with_index.to_a.to_h
		flash_hash.delete_if {|key,val| key.subject_id != flashcard.subject_id }
		
		index = flash_hash[flashcard]
		flash_hash.delete_if {|key,val| val <= index}
		
		return flashcard if flash_hash.empty?
		return flash_hash.keys.first;
	end

end
