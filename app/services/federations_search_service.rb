class FederationsSearchService
  def self.search(current_federations, query)
    current_federations.where("name like '%#{query}%'")
  end
end