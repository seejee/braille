$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'motion-testflight'

Motion::Project::App.setup do |app|
  app.name = 'braille'
  app.version = '1.1'
  app.prerendered_icon = true
  app.icons = %w{icon-57.png icon-75.png icon-114.png}
  app.interface_orientations = [:portrait]

  app.codesign_certificate = 'iPhone Distribution: Christopher Geihsler'
  app.identifier = "9AFERCNN67.com.spandrelsoftware.braille"
  app.provisioning_profile = "/Users/seejee/Distribution_Profile.mobileprovision"

  app.testflight.sdk = 'vendor/TestFlightSDK'
  app.testflight.api_token = '0aad2fd685bec400ce58e004fc54f48c_NDYwMzY4MjAxMi0wNS0yOCAxOTo0OToxMS4wMjE5Njk'
  app.testflight.team_token = 'a7be69e68b6c13aaf1d2bf7f52325093_OTQ0NDEyMDEyLTA1LTI4IDIwOjAyOjEwLjM1NDE0NQ'

  app.files += Dir.glob(File.join(app.project_dir, 'vendor/braille_ueb/lib/**/*.rb'))
end
