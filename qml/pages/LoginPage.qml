import Felgo 3.0
import QtQuick 2.0

Page {
  z: 100

  signal login()

  Column {
    anchors.centerIn: parent
    spacing: dp(15)
    width: dp(200)

    AppText {
      text: "Welcome!"
      font.pixelSize: sp(30)
      font.bold: true
    }

    AppText {
      text: "Sign in to your Jira Account"
      color: Theme.secondaryTextColor
    }

    AppTextField {
      id: url
      width: parent.width
      inputMode: inputModeUrl
    }

    AppTextField {
      id: email
      width: parent.width
      inputMode: inputModeEmail
    }

    AppTextField {
      id: pwd
      width: parent.width
      inputMode: inputModePassword
    }

    AppButton {
      text: "Sign In"
      flat: false
      minimumWidth: parent.width
      enabled: url.length > 0 && email.length > 0 && pwd.length > 0
      onClicked: {
        login()
      }
    }
  }
}
