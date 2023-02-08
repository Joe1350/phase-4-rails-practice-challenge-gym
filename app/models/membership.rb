class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validate :only_one_membership

    def only_one_membership
        # byebug
        gym_id = self.gym_id
        client = Client.find(self.client_id)
        client.gyms.each do |gym|
            unless gym.id != gym_id
                errors.add(:memberships, "Only one membership allowed")
            end
        end
    end

end
