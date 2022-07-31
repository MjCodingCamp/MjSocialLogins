//
//  GoogleSignIn.swift
//  MjSocialLogins
//
//  Created by Mohammad Jeeshan on 30/07/22.
//  Copyright (c) 2022 Mohammad Jeesha. All rights reserved.
//

import UIKit
import SwiftUI
import GoogleSignIn

public protocol GoogleLoginStatusProtocol {
    func googleLoginSuccess(userID: String, idToken: String, profileImageUrl: String?,
                      email: String?, firstName: String?, lastName: String?)
    func googleLoginFail(error: String)
}

public class GoogleLoginController {
    private var delegate: GoogleLoginStatusProtocol
    
    public init(delegate: GoogleLoginStatusProtocol) {
        self.delegate = delegate
    }
    
    public func beginGoogleLogin(clientID: String){
        guard let rootViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            self.delegate.googleLoginFail(error: kRootViewControllerNotFound)
            return
        }
        signIn(clientID: clientID, viewController: rootViewController)
    }
    
    private func signIn(clientID: String, viewController: UIViewController){
        let signInConfig = GIDConfiguration.init(clientID: clientID)
        GIDSignIn.sharedInstance.signIn( with: signInConfig, presenting: viewController, callback: { user, error in
            if let error = error {
                self.delegate.googleLoginFail(error: error.localizedDescription)
            } else {
                guard let currentUser = user else {
                    self.delegate.googleLoginFail(error: kUserDataNotFound)
                    return
                }
                guard let userID = currentUser.userID else {
                    self.delegate.googleLoginFail(error: kUserIdNotFound)
                    return
                }
                guard let idToken = currentUser.authentication.idToken else {
                    self.delegate.googleLoginFail(error: kUserIdTokenNotFound)
                    return
                }
                let userEmail = currentUser.profile?.email
                let firstName = currentUser.profile?.givenName
                let lastName = currentUser.profile?.familyName
                let profileImageUrl = currentUser.profile?.imageURL(withDimension: 100)?.absoluteString
                self.delegate.googleLoginSuccess(userID: userID, idToken: idToken,
                                           profileImageUrl: profileImageUrl, email: userEmail,
                                           firstName: firstName, lastName: lastName)
            }
        })
    }
    
}
