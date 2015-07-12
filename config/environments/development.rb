Primeradar::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # 電子メール使用するかの有無
  config.action_mailer.perform_deliveries = true
  # 電子メールが配信完了できない場合に、エラーを発生させるか
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { host: 'localhost:3000' }

  # 電子メールの配信方法を設定する
  config.action_mailer.delivery_method = :test
  config.action_mailer.default_options = { from: 'key101now@gmail.com' }
  # config.action_mailer.smtp_settings = {
  #   address:              'localhost',
  #   port:                 587,
  #   domain:               'localhost:3000',
  #   authentication:       'plain',
  #   enable_starttls_auto: true  }

  config.assets.debug = true
  # Primeradar::DeveloperMail = [ "fukuimone@gmail.com" ]
  # Primeradar::MailFrom = "key101now@gmail.com"
end
