
require_relative "ios_screens"

class IOSScreens
  attr_accessor :home, :login, :my_account, :product, :cart

  def initialize
    @home = Home.new
    @login = Login.new
    @my_account = MyAccount.new
    @product = Product.new
    @cart = Cart.new
  end

  def popup
    find_element(xpath: "//XCUIElementTypeAlert//XCUIElementTypeStaticText[last()]")
  end

  def accept_popup
    find_element(xpath: "//XCUIElementTypeAlert//XCUIElementTypeButton[@name='OK']").click
  end

  def wait_popup(title)
    find_elements(id: "//XCUIElementTypeStaticText[@value='#{title}']")
  end

  def allow_notifications
    target = find_element(xpath: "//XCUIElementTypeAlert//XCUIElementTypeButton[@name='Allow']")
    target.click if target.displayed?
  end

  def paypal_login(user)
    find_element(xpath: "//XCUIElementTypeTextField[@value='Email']").send_keys(user["email"])
    find_element(xpath: "//XCUIElementTypeSecureTextField[@value='Password']").send_keys(user["senha"])
    find_element(id: "Log In").click
  end

  def pay_pal
    find_element(id: "Pay").click
  end
end
