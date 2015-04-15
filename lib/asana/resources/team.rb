### WARNING: This file is auto-generated by the asana-api-meta repo. Do not
### edit it manually.

module Asana
  module Resources
    # A _team_ is used to group related projects and people together within an
    # organization. Each project in an organization is associated with a team.
    class Team < Resource

      attr_reader :id

      attr_reader :name

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'teams'
        end

        # Returns the full record for a single team.
        #
        # id - [Id] Globally unique identifier for the team.
        def find_by_id(client, id)

          new(body(client.get("/teams/#{id}")), client: client)
        end

        # Returns the compact records for all teams in the organization visible to
        # the authorized user.
        #
        # organization - [Id] Globally unique identifier for the workspace or organization.
        def find_by_organization(client, organization:)

          Collection.new(body(client.get("/organizations/#{organization}/teams")).map { |data| new(data, client: client) }, client: client)
        end

        # Returns the compact records for all users that are members of the team.
        #
        # team - [Id] Globally unique identifier for the team.
        def users(client, team:)

          Collection.new(body(client.get("/teams/#{team}/users")).map { |data| Resource.new(data, client: client) }, client: client)
        end
      end

    end
  end
end
