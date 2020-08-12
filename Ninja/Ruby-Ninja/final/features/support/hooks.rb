require "report_builder"
require "date"

Before do
  driver.start_driver
  driver.manage.timeouts.implicit_wait = 10

  #device_type = "ios"
  @screen = DroidScreens.new if DEVICE.eql?("android")
  if DEVICE.eql?("ios")
    @screen = IOSScreens.new
    @screen.allow_notifications
  end
end

Before("@login") do
  @user = { email: "fernando@qaninja.io", pass: "pass123" }
  @screen.home.go_account
  @screen.login.with(@user[:email], @user[:pass])
end

Before("@clean_cart") do
  @user = { email: "fernando@qaninja.io", pass: "pass123" }
  PixelApi.new.remove_my_cart(@user[:email])
end

After do
  screenshot = driver.screenshot_as(:base64)
  embed(screenshot, "image/png", "Screenshot")

  driver.quit_driver
end

at_exit do
  @infos = {
    "device" => DEVICE.upcase,
    "environment" => "Dev",
    "Data do Teste" => Time.now.to_s,
  }

  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/report"
    config.report_types = [:html]
    config.report_title = "Pixel Mobile"
    config.additional_info = @infos
    config.color = "indigo"
  end
  ReportBuilder.build_report
end
