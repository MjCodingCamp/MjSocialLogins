//
//  Constant.swift
//  MjSocialLogins
//
//  Created by Mohammad Jeeshan on 30/07/22.
//  Copyright (c) 2022 Mohammad Jeesha. All rights reserved.
//


//MARK: some constant strings
let kEmailPermission = "email"
let kProfilePermission = "public_profile"
let kParamaterFields = "fields"
let kFieldsName = "id, name, email"
let kAppleUserName = "appleUserName"
let kAppleUserEmail = "appleUserEmail"

//MARK: some constant error enums
public enum FbAuthError {
    case facebookDeclinedPermissions
    case tokenNotFound
    case userDataNotFound
    case facebookLoginCancelled
    case unknown(String)
}

public enum GoogleAuthError {
    case rootViewControllerNotFound
    case userIdNotFound
    case userIdTokenNotFound
    case userDataNotFound
    case userProfileNotFound
    case unknown(String)
}

public enum AppleAuthError {
    case appleDeclinedPermissions
    case accessTokenNotFound
    case userDataNotFound
    case unknown(String)
}
