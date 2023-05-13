class Coffee < ApplicationRecord
  belongs_to :user

  def fetch_random_coffee_image
    response = RestClient.get 'https://api.unsplash.com/photos/random?query=coffee', {params: {client_id: OC47tUJ8sTjie4ghNrAo03aUPDi_OCxB8FP1rPaohFI}}

    data = JSON.parse(response.body)
    data["urls"]["small"]
  end

end
