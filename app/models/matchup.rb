class Matchup < ApplicationRecord

	has_many :selections
	has_many :probes
end
