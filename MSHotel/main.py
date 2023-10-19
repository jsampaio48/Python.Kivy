from sys import path
from kivy.uix.screenmanager import ScreenManager
from kivy.app import App

path.append('/usr/lib/python3/dist-pachages/')

class SwitchScreen(ScreenManager):
    def loginC(self):
        self.L = Login
