from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from Screens.consumer_screen import ConsumerScreen
from models import Base, create_engine

class MainScreen(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        layout = BoxLayout(orientation='vertical')
        self.add_widget(layout)

        consumers_button = Button(text='Gerenciar Clientes', on_press=self.switch_to_consumers)
        self.add_widget(consumers_button)

        products_button = Button(text='Gerenciar Produtos', on_press=self.switch_to_products)
        self.add_widget(products_button)

        # sales_button = Button(text='Gerenciar Vendas', on_press=self.switch_to_sales)
        # self.add_widget(sales_button)

    def switch_to_consumers(self, instance):
        self.manager.current='consumer_screen'

    def switch_to_products(self, instance):
        self.manager.current='product_screen'

    # def switch_to_sales(self, instance):
    #     self.manager.current='sale_screen'

