Rails.application.config.to_prepare do
  # Fresh bus and handlers on reload keep command routing aligned with the domain code.
  Rails.configuration.command_bus = Command::Bus.new

  voting_service = Voting::Service.new
  Rails.configuration.command_bus.register(Voting::UpvoteEvent,   voting_service)
  Rails.configuration.command_bus.register(Voting::DownvoteEvent, voting_service)
end
