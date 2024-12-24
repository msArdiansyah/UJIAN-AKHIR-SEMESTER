from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.gridlayout import GridLayout
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.checkbox import CheckBox

# Encapsulation: Base class
class User:
    def __init__(self, username, password):
        self.username = username
        self.password = password

    def verify_login(self, username, password):
        return self.username == username and self.password == password

# Inheritance: Customer inherits from User
class Customer(User):
    def __init__(self, username, password, customer_id):
        super().__init__(username, password)
        self.customer_id = customer_id

    def get_customer_details(self):
        return f"Customer ID: {self.customer_id}, Username: {self.username}"

# Polymorphism: Overriding
class Product:
    def __init__(self, product_id, name, price):
        self.product_id = product_id
        self.name = name
        self.price = price

    def display_product(self):
        return f"Product: {self.name}, Price: {self.price}"

# Derived class with overridden method
class DiscountedProduct(Product):
    def __init__(self, product_id, name, price, discount):
        super().__init__(product_id, name, price)
        self.discount = discount

    def display_product(self):
        discounted_price = self.price - (self.price * self.discount / 100)
        return f"Product: {self.name}, Discounted Price: {discounted_price}"

# Interface Management: Main GUI class
class StoreApp(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', **kwargs)
        
        # Login Section
        self.add_widget(Label(text="Username:"))
        self.username_input = TextInput()
        self.add_widget(self.username_input)

        self.add_widget(Label(text="Password:"))
        self.password_input = TextInput(password=True)
        self.add_widget(self.password_input)

        self.login_button = Button(text="Login")
        self.login_button.bind(on_press=self.verify_user)
        self.add_widget(self.login_button)

        # Widgets for managing products
        self.product_label = Label(text="Manage Products")
        self.add_widget(self.product_label)
        
        self.product_input = TextInput(hint_text="Product Name")
        self.add_widget(self.product_input)

        self.price_input = TextInput(hint_text="Price")
        self.add_widget(self.price_input)

        self.add_product_button = Button(text="Add Product")
        self.add_product_button.bind(on_press=self.add_product)
        self.add_widget(self.add_product_button)

        self.product_display = Label(text="Products List")
        self.add_widget(self.product_display)

        self.products = []  # Store products

    def verify_user(self, instance):
        # Hardcoded user for demonstration purposes
        user = Customer(username="admin", password="1234", customer_id=1)
        if user.verify_login(self.username_input.text, self.password_input.text):
            self.product_label.text = "Welcome, Admin! Manage Products Below:"
        else:
            self.product_label.text = "Login Failed! Try Again."

    def add_product(self, instance):
        product_name = self.product_input.text
        try:
            product_price = float(self.price_input.text)
            new_product = Product(product_id=len(self.products) + 1, name=product_name, price=product_price)
            self.products.append(new_product)
            self.update_product_display()
        except ValueError:
            self.product_label.text = "Invalid price. Please enter a number."

    def update_product_display(self):
        product_list = "\n".join([product.display_product() for product in self.products])
        self.product_display.text = f"Products List:\n{product_list}"

class TokoBangunanApp(App):
    def build(self):
        return StoreApp()

if __name__ == '__main__':
    TokoBangunanApp().run()
