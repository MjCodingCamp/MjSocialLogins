# MjSocialLogins
A simple & lightweight open source library for all standard social logins such as Apple, Google and Facebook. It provides support for both iOS frameworks (UIKit & SwiftUI). With the help of this single library, you can integrate Facebook, Apple and Google login into your project very quickly.

[![Version](https://img.shields.io/cocoapods/v/MjSocialLogins.svg?style=flat)](https://cocoapods.org/pods/MjSocialLogins)
[![License](https://img.shields.io/cocoapods/l/MjSocialLogins.svg?style=flat)](https://cocoapods.org/pods/MjSocialLogins)
[![Platform](https://img.shields.io/cocoapods/p/MjSocialLogins.svg?style=flat)](https://cocoapods.org/pods/MjSocialLogins)
[![UIKit](https://img.shields.io/badge/UIKit-orange.svg?style=flat)](https://developer.apple.com/documentation/uikit)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-blue.svg?style=flat)](https://developer.apple.com/xcode/swiftui/)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Integrate Facebook Login
* **Step-1 Install Pod:** Add pod 'MjSocialLogins' in your pod file and install pod.

```ruby
pod 'MjSocialLogins'
```
* **Step-2 Import Library:** Extend the view controller with FbLoginStatusDelegate protocol and add all its required methods. Now create an instance of the FbLoginController class & call beginFbLogin() method on your button click event.

<img width="817" alt="Screenshot 2022-08-14 at 10 07 57 PM" src="https://user-images.githubusercontent.com/66344914/184546405-e34294d7-9aea-410f-a2cc-cdd4e668f368.png">

<img width="818" alt="Screenshot 2022-08-14 at 10 15 33 PM" src="https://user-images.githubusercontent.com/66344914/184546694-ae18014f-2ca2-4a63-9ae5-ccbeb0f038aa.png">


* **Step-3 Configure Info.plist:** In Xcode right-click on Info.plist, and choose Open As Source Code.
Copy and paste the following XML snippet into the body of your file (<dict>...</dict>), replacing [APP_ID] with Facebook application id, [CLIENT_TOKEN] value found under Settings > Advanced > Client Token in your App Dashboard and [APP_NAME] with Facebook application name

```ruby
<key>CFBundleURLTypes</key>
<array>
  <dict>
  <key>CFBundleURLSchemes</key>
  <array>
    <string>fb[APP_ID]</string>
  </array>
  </dict>
</array>
<key>FacebookAppID</key>
<string>[APP_ID]</string>
<key>FacebookClientToken</key>
<string>[CLIENT_TOKEN]</string>
<key>FacebookDisplayName</key>
<string>[APP_NAME]</string>
<key>FacebookAutoLogAppEventsEnabled</key>
<true/>
<key>FacebookAdvertiserIDCollectionEnabled</key>
<true/>
```

## Requirements

* iOS 9+
* Xcode 11+

## Installation

MjFbLogin is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MjFbLogin'
```

## Author

Mohammad Jeeshan
```ruby
mohammad.jeeshan.91@gmail.com
```

## License

MjFbLogin is available under the MIT license. See the LICENSE file for more info.

## Social Media 

Please follow me on social media
* [![Github](https://img.shields.io/badge/Github-@MjCodingCamp-black.svg?style=flat)](https://github.com/MjCodingCamp)
* [![Twitter](https://img.shields.io/badge/Twitter-@MjCodingCamp-blue.svg?style=flat)](https://twitter.com/MjCodingCamp)
* [![Medium](https://img.shields.io/badge/Medium-@MjCodingCamp-orange.svg?style=flat)](https://medium.com/@MjCodingCamp)


