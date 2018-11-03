Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.base_controller_class = 'ActionController::API'
  config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/#{Rails.env}_access.log"
  config.lograge.keep_original_rails_log = false
  config.lograge.ignore_actions = ['ApplicationController#health_check']
  config.lograge.custom_options = lambda do |event|

    exceptions = %w(controller action format id)
    {
        ip: event.payload[:headers]['X-Real-IP'] || event.payload[:headers]['REMOTE_ADDR'],
        params: event.payload[:params].except(*exceptions),
        timestamp: Time.now.strftime('%F %T.%3N')
    }
  end
end
