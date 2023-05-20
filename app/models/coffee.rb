class Coffee < ApplicationRecord
  validates :region, :bean, :sensory_note, :classification, :grinding, :brand, :price, :description, :roast, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :classification, inclusion: { in: 85..100 }
  has_many :sales
  has_many :users, through: :sales

  # include PgSearch::Model
  # pg_search_scope :search_coffee,
  #   against: [ :brand ],
  #   associated_against: {
  #     coffees: [ :region, :grinding ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :brand ],
    using: {
      tsearch: { prefix: true }
    }


  def fetch_random_coffee_image
    response = RestClient.get 'https://api.unsplash.com/photos/random?query=coffee', {params: {client_id: OC47tUJ8sTjie4ghNrAo03aUPDi_OCxB8FP1rPaohFI}}

    data = JSON.parse(response.body)
    data["urls"]["small"]
  end
end
