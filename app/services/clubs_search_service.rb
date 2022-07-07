class ClubsSearchService
  def self.search(current_clubs, query)
    current_clubs.where("name like '%#{query}%'")
  end
end
