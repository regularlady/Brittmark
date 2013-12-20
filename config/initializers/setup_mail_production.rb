if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV["app19964849@heroku.com"],
    :password       => ENV["gxkgvxqt"],
    :domain         => 'brittmark.co',
    :enable_starttls_auto => true
  }
end