class Api::Subdomain
  def self.matches?(request)

    # Rails.env.development? ? request.subdomain == 'api'.freeze : true
    Rails.env.production? && ENV['DOMAIN'] == 'app.xyz.com' ? request.subdomain == 'api'.freeze : true
  end
end
