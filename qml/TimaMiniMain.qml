import Felgo 3.0
import QtQuick 2.0
import "pages"
import "model"

App {
  id: app

  onInitTheme: {
    Theme.colors.tintColor = "#0052CC"
    Theme.tabBar.textSize = sp(15)
  }

  DataModel {
    id: dataModel
  }

  LoginPage {
    visible: !dataModel.loggedIn
    onLogin: dataModel.login()
  }

  Navigation {
    id: navigation
    drawerMinifyEnabled: true
    drawerLogoSource: Qt.resolvedUrl("../assets/jira-logo.png")

    NavigationItem {
      title: qsTr("Worklogs")
      icon: IconType.clocko
//      AppText {
//          id: title
//          text: qsTr("Worklogs")
//          fontSize: sp(40)
//      }

      NavigationStack {
        splitView: app.tablet && app.landscape
        leftColumnWidth: parent.width/2

        WorklogsPage {}
      }
    }

    NavigationItem {
      title: "Issues"
      icon: IconType.magic

      NavigationStack {
        splitView: app.tablet && app.landscape
        leftColumnWidth: parent.width/2

        IssuesPage {}
      }
    }

    NavigationItem {
      title: "Account"
      icon: IconType.user

      NavigationStack {

        AccountPage {}
      }
    }
  }
}
