module PokerstatsClient
  class RationalPoker
    class PokerSession < ActiveResource::Base
      RationalPoker::RESOURCES << self
      def self.login(rational_poker_url, user, password)
        self.site = rational_poker_url
        self.user = user
        self.password = password
      end
      def self.find_by_name name
        find(:first, :params=> {:q => name})
      end
      def self.find_or_create_by_name name, hash={}
        result = find_by_name name
        if result.nil?
          result = create({:name => name}.merge(hash))
        end
        result
      end
    end
  end
end