class Declaration < ApplicationRecord
  has_many_attached :documents
  has_many_attached :pictures

  DECLARATIONS='declarations'
  TO_ENROLLEE='to enrollee'
  TO_STUDENTS='to students'
  TO_GRADUATES='to graduates'
  BELONGS_TO_PAGE ={DECLARATIONS => 'declarations',
  TO_ENROLLEE => 'to enrollee',
  TO_STUDENTS => 'to students',
  TO_GRADUATES => 'to graduates' }

end
