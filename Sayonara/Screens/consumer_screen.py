from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.screenmanager import Screen
from models import Consumer

class ConsumerScreen(Screen):
    def __init__(self, db_session, **kwargs):
        super().__init__(**kwargs)
        self.db_session = db_session

        layout = BoxLayout(orientation='vertical')
        self.add_widget(layout)

        self.name_input = TextInput(hint_text='Name')
        self.email_input = TextInput(hint_text='Email')
        self.add_button = Button(text='Add Consumer', on_press=self.add_consumer)

        layout.add_widget(Label(text='Consumer Management'))
        layout.add_widget(self.name_input)
        layout.add_widget(self.email_input)
        layout.add_widget(self.add_button)

    def add_consumer(self, instance):
        name = self.name_input.text
        email = self.email_input.text

        new_consumer = Consumer(name=name, email=email)
        self.db_session.add(new_consumer)
        self.db_session.commit()

        self.name_input.text = ''
        self.email_input.text = ''
