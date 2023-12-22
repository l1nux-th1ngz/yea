from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QLineEdit, QListWidget, QRadioButton

class MyApp(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        vbox = QVBoxLayout()
        self.setLayout(vbox)

        self.lineEdits = [QLineEdit(self) for _ in range(8)]
        for lineEdit in self.lineEdits:
            vbox.addWidget(lineEdit)

        self.listWidget = QListWidget(self)
        vbox.addWidget(self.listWidget)

        self.radioBtnInstall = QRadioButton('Install', self)
        vbox.addWidget(self.radioBtnInstall)

        self.radioBtnUninstall = QRadioButton('Uninstall', self)
        vbox.addWidget(self.radioBtnUninstall)

        btn = QPushButton('OK', self)
        btn.clicked.connect(self.on_click)
        vbox.addWidget(btn)

    def on_click(self):
        packages = [lineEdit.text() for lineEdit in self.lineEdits if lineEdit.text()]
        action = 'Install' if self.radioBtnInstall.isChecked() else 'Uninstall'
        for package in packages:
            self.listWidget.addItem(f'{action}: {package}')
            # Add code here to install or uninstall the package

if __name__ == '__main__':
    import sys
    app = QApplication(sys.argv)
    ex = MyApp()
    ex.show()
    sys.exit(app.exec_())
