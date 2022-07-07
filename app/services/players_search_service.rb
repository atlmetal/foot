class PlayersSearchService
  def self.search(current_players, query)
    current_players.where("name like '%#{query}%'")
  end
end
