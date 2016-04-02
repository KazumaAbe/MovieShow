CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 'movie-s3user-bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/movie-s3user-bucket'

    when 'development'
      config.fog_directory = 'dev.movie-s3user-bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.movie-s3user-bucket'

    when 'test'
      config.fog_directory = 'test.movie-s3user-bucket'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.movie-s3user-bucket'
  end
end
