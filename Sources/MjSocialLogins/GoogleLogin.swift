//
//  GoogleLogin.swift
//  MjSocialLogins
//
//  Created by Mohammad Jeeshan on 30/07/22.
//  Copyright (c) 2022 Mohammad Jeeshan. All rights reserved.
//

import SwiftUI
import UIKit
import GoogleSignIn

public protocol GoogleLoginStatusDelegate {
    func googleLoginSuccess(userID: String, idToken: String, userProfile: GIDProfileData)
    func googleLoginFail(error: GoogleAuthError)
}

public class GoogleLoginController {
    private var delegate: GoogleLoginStatusDelegate?
    
    public init(delegate: GoogleLoginStatusDelegate) {
        self.delegate = delegate
    }
    
    public func beginGoogleLogin(clientID: String){
        guard let rootViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            self.delegate?.googleLoginFail(error: .rootViewControllerNotFound)
            self.delegate = nil
            return
        }
        signIn(clientID: clientID, viewController: rootViewController)
    }
    
    private func signIn(clientID: String, viewController: UIViewController){
        let signInConfig = GIDConfiguration.init(clientID: clientID)
        GIDSignIn.sharedInstance.signIn( with: signInConfig, presenting: viewController) { user, error in
            if let error = error {
                self.delegate?.googleLoginFail(error: .unknown(error.localizedDescription))
                self.delegate = nil
            } else {
                guard let currentUser = user else {
                    self.delegate?.googleLoginFail(error: .userDataNotFound)
                    self.delegate = nil
                    return
                }
                guard let userID = currentUser.userID else {
                    self.delegate?.googleLoginFail(error: .userIdNotFound)
                    self.delegate = nil
                    return
                }
                guard let idToken = currentUser.authentication.idToken else {
                    self.delegate?.googleLoginFail(error: .userIdTokenNotFound)
                    self.delegate = nil
                    return
                }
                guard let userProfile = currentUser.profile else {
                    self.delegate?.googleLoginFail(error: .userProfileNotFound)
                    self.delegate = nil
                    return
                }
                self.delegate?.googleLoginSuccess(userID: userID, idToken: idToken,userProfile: userProfile)
                self.delegate = nil
            }
        }
    }
}

