from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.screenmanager import Screen
from models import Sale

class SaleScreen(Screen):
    def __init__(self, db_session, **kwargs):
        super().__init__(**kwargs)
        self.db_session = db_session

        layout = BoxLayout(orientation='vertical')
        self.add_widget(layout)

        self.consumer_id_input = TextInput(hint_text='Consumer')
        self.product_input = TextInput(hint_text='Product')
        self.quantity_input = TextInput(hint_text='Quantity')
        self.add_button = Button(text='Add Sale', on_press=self.add_sale)

        layout.add_widget(Label(text='Sale Management'))
        layout.add_widget(self.consumer_id_input)
        layout.add_widget(self.product_input)
        layout.add_widget(self.quantity_input)

        layout.add_widget(self.add_button)

    def add_sale(self, instance):
        consumer_id = int(self.consumer_id_input.text)
        product_id = int(self.product_input.text)
        quantity = int(self.quantity_input.text)

        new_sale = Sale(consumer_id=consumer_id, product_id=product_id, quantity=quantity)
        self.db_session.add(new_sale)
        self.db_session.commit()

        self.consumer_id_input.text = ''
        self.product_input.text = ''
        self.quantity_input.text = ''
