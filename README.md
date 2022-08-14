# MjSocialLogins
A simple & lightweight open source library for all standard social logins such as Apple, Google and Facebook. It provides support for both iOS frameworks (UIKit & SwiftUI). With the help of this single library, you can integrate Facebook, Apple and Google login into your project very quickly.

[![Version](https://img.shields.io/cocoapods/v/MjSocialLogins.svg?style=flat)](https://cocoapods.org/pods/MjSocialLogins)
[![License](https://img.shields.io/cocoapods/l/MjSocialLogins.svg?style=flat)](https://cocoapods.org/pods/MjSocialLogins)
[![Platform](https://img.shields.io/cocoapods/p/MjSocialLogins.svg?style=flat)](https://cocoapods.org/pods/MjSocialLogins)
[![UIKit](https://img.shields.io/badge/UIKit-orange.svg?style=flat)](https://developer.apple.com/documentation/uikit)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-blue.svg?style=flat)](https://developer.apple.com/xcode/swiftui/)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 13+
* Xcode 11+

## Installation

MjSocialLogins is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MjSocialLogins'
```

## Integrate Facebook Login
* **Step-1 Install Pod:** Add pod 'MjSocialLogins' in your pod file and install pod.

```ruby
pod 'MjSocialLogins'
```
* **Step-2 Import Library:** Extend the view controller with **FbLoginStatusDelegate** protocol and add all its required methods. Now create an instance of the FbLoginController class & call beginFbLogin() method on your button click event.


```ruby
//FbLogin Delegate methods
extension ContentView: FbLoginStatusDelegate {
    func fbLoginSuccess(token: String, userData: [String : Any]) {
        //Handle success result acc to your app logic.
        debugPrint(userData)
    }
    
    func fbLoginFail(error: FbAuthError) {
        switch error {
        case .facebookDeclinedPermissions:
            break
        case .tokenNotFound:
            break
        case .userDataNotFound:
            break
        case .facebookLoginCancelled:
            break
        case .unknown(let error):
            debugPrint(error)
        }
    }
    
    func fbLoginAccess(status: Bool) {
        //You can use this delegate method to start your loader.
        debugPrint(status)
    }
}
```

```ruby
Button {
     let fbLoginController = FbLoginController(delegate: self)
     fbLoginController.beginFbLogin()
} label: {
     Text("Continue with Facebook")
         .frame(width: UIScreen.main.bounds.width * 0.8)
         .padding()
         .font(.headline)
         .foregroundColor(Color.white)
         .background(Color.green)
         .cornerRadius(8)
}
```

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

## Integrate Apple Login
* **Step-1 Add Capability:** Add **Sign in with Apple** capability, You can add this capability by clicking on plus button in your project target settings. If this capability doesn't display in your capabilities list, it mean you need add this capability into your certificates. 

![Screenshot 2022-08-14 at 10 35 1](https://user-images.githubusercontent.com/66344914/184547952-9e2cfffc-1a99-43b2-9ea9-0f133239863d.png)

* **Step-2 Import Library:** Extend the view controller with **AppleLoginStatusDelegate** protocol and add all its required methods. Now create an instance of the AppleLoginController class & call beginAppleLogin() method on your button click event.

```ruby 
//AppleLogin Delegate methods
extension ContentView: AppleLoginStatusDelegate {
    func appleLoginSuccess(accessToken: String, name: String, email: String) {
        //Handle success result acc to your app logic.
        debugPrint(accessToken)
    }
    
    func appleLoginFail(error: AppleAuthError) {
        //Handle failure cases as you want.
        switch error {
        case .appleDeclinedPermissions:
            break
        case .accessTokenNotFound:
            break
        case .userDataNotFound:
            break
        case .unknown(let error):
            debugPrint(error)
        }
    }
} 
```

## Author

Mohammad Jeeshan
```ruby
mohammad.jeeshan.91@gmail.com
```

## License

MjSocialLogins is available under the MIT license. See the LICENSE file for more info.

## Social Media 

Please follow me on social media
* [![Github](https://img.shields.io/badge/Github-@MjCodingCamp-black.svg?style=flat)](https://github.com/MjCodingCamp)
* [![Twitter](https://img.shields.io/badge/Twitter-@MjCodingCamp-blue.svg?style=flat)](https://twitter.com/MjCodingCamp)
* [![Medium](https://img.shields.io/badge/Medium-@MjCodingCamp-orange.svg?style=flat)](https://medium.com/@MjCodingCamp)


