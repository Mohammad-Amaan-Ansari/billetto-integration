Rails.application.config.to_prepare do
  # Rebuild the client on each code reload so subscriptions stay wired in development.
  Rails.configuration.event_store = RailsEventStore::Client.new(
    message_broker: RubyEventStore::Broker.new(
      subscriptions: RubyEventStore::Subscriptions.new,
      dispatcher: RubyEventStore::Dispatcher.new
    )
  )
  ApplicationSubscriptions.register(Rails.configuration.event_store)
end
