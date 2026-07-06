## 1.2.0

* Adds Swift Package Manager support on iOS (CocoaPods remains supported)
* Adds a privacy manifest (`PrivacyInfo.xcprivacy`) declaring the disk space required reason APIs used by the plugin
* Regenerates the example app's iOS project with the latest Flutter template
* Updates README with platform support and privacy manifest details


## 1.1.0

* Migrates the Android build to Flutter's built-in Kotlin support (AGP 9 / Flutter 3.44+)
* Remains backward compatible with apps built on older AGP versions (< 9), where the Kotlin Gradle Plugin is still applied automatically
* Converts the Android Gradle files to Kotlin DSL (`build.gradle.kts`)
* Removes the deprecated `package` attribute from the Android manifest (required by AGP 9)
* Regenerates the example app's Android project with the latest Flutter template


## 1.0.1

* Refactor some variables names in example, tests and readme


## 1.0.0

* Initial release
