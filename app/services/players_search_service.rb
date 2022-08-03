class PlayersSearchService
  def self.search(current_players, query)
    players_ids = Rails.cache.fetch("players_search/#{query}", expires_in: 1.hours) do
      #query SQL en DB basada en texto no optimizado, caching para esto
      current_players.where("name like '%#{query}%'").map(&:id)
    end

    current_players.where(id: players_ids)
  end
end
