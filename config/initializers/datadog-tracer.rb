# config/initializers/datadog-tracer.rb
require 'ddtrace'

Datadog.configure do |c|
  c.use :rails, service_name: 'my-rails-app'
end

Rails.configuration.datadog_trace =
    {
        auto_instrument: true
    }