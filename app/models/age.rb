class Age < ActiveHash::Base
  self.data = [
    { id: 1, age: '---' },
    { id: 2, age: '0' },
    { id: 3, age: '1' },
    { id: 4, age: '2' },
    { id: 5, age: '3' },
    { id: 6, age: '4' },
    { id: 7, age: '5' },
    { id: 8, age: '6' },
  ]

  include ActiveHash::Associations
  has_many :plans
end