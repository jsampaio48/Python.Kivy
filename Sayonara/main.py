from kivy.app import App
from kivymd.uix.screenmanager import MDScreenManager
from sqlalchemy import create_engine
from models import Base
from Screens.main_screen import MainScreen
from Screens.consumer_screen import ConsumerScreen
from Screens.product_screen import ProductScreen

engine = create_engine('sqlite:///:memory:', echo=True)
Base.metadata.create_all(engine)

class SayonaraApp(App):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.db_session = None
        self.load_all_kv_files(self.directory)

    def build(self):

        sm = MDScreenManager()
        sm.add_widget(MainScreen(name='main_screen'))
        sm.add_widget(ProductScreen())
        sm.add_widget(ConsumerScreen(db_session=self.db_session, name='consumer_screen'))
        return sm

    def on_stop(self):
        self.db_session.close()

if __name__ == '__main__':
    SayonaraApp().run()