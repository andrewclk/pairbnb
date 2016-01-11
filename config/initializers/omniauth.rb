OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1535368836776174', '3833eb8de64174288c09adaa6dc9cc90'
end

