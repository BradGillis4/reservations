Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], :skip_jwt => true
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#         provider :facebook, ENV['facebook_client_id'], ENV['facebook_client_secret'], :skip_jwt => true
#     end

# OmniAuth.config.on_failure = Proc.new { |env|
#   OmniAuth::FailureEndpoint.new(env).redirect_to_failure
# }

# OmniAuth.config.on_failure = -> (env) do
#     Rack::Response.new(['302 Moved'], 302, 'Location' => env['omniauth.origin'] || "/").finish
#   end