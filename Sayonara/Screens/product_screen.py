from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.screenmanager import Screen
from models import Product

class ProductScreen(Screen):
    def __init__(self, db_session, **kwargs):
        super().__init__(**kwargs)
        self.db_session = db_session

        layout = BoxLayout(orientation='vertical')
        self.add_widget(layout)

        self.name_input = TextInput(hint_text='Name')
        self.price_input = TextInput(hint_text='Price')
        self.add_button = Button(text='Add Product', on_press=self.add_product)

        layout.add_widget(Label(text='Product Management'))
        layout.add_widget(self.name_input)
        layout.add_widget(self.price_input)
        layout.add_widget(self.add_button)

    def add_consumer(self, instance):
        name = self.name_input.text
        price = float(self.price_input.text)

        new_product = Product(name=name, price=price)
        self.db_session.add(new_product)
        self.db_session.commit()

        self.name_input.text = ''
        self.price_input.text = 0
