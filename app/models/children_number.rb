class ChildrenNumber < ActiveHash::Base
  self.data = [
    { id: 1, children_number: '---' },
    { id: 2, children_number: '1' },
    { id: 3, children_number: '2' },
    { id: 4, children_number: '3' },
    { id: 5, children_number: '4' },
    { id: 6, children_number: '5' },
    { id: 7, children_number: '6〜' },
  ]
  include ActiveHash::Associations
  has_many :reservations
end