
class Home
  def go_account
    find_element(xpath: "//XCUIElementTypeNavigationBar[@name='NinjaPixel']/XCUIElementTypeButton").click
  end

  def choose_cat(cat)
    find_elements(id: "catName").text(cat).click
  end

  def go_to_cart
    find_element(xpath: "//XCUIElementTypeTabBar/XCUIElementTypeButton[3]").click
  end
end

class Product
  # violando uma regra, pq clareza do meu teste é mais importante
  def go_to(product)
    find_elements(id: "productName").text(product).click
  end

  def add_to_cart
    find_element(id: "btnAddToCart").click
  end
end

class Cart
  def refresh
    find_element(xpath: "//XCUIElementTypeNavigationBar[@name='CARRINHO']/XCUIElementTypeButton").click
  end

  def checkout
    find_element(id: "btnCheckOut").click
  end
end

class Login
  def with(email, pass)
    txt_email = find_element(id: "txtEmail")
    txt_pass = find_element(id: "txtPassword")
    txt_email.click
    txt_email.send_keys(email)
    txt_pass.click
    txt_pass.send_keys(pass)
    find_element(id: "btnLogin").click
  end
end

class MyAccount
  def view
    find_element(id: "userAccount")
  end
end
