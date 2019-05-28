//
//  UserStore.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/08.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import SwiftyUserDefaults

//struct UserStore {
//    static var user: User? {
//        get {
//            return Defaults[.user].map { try? User(serializedData: $0) } ?? nil
//        }
//        set {
//            Defaults[.user] = newValue.map { try? $0.serializedData() } ?? nil
//        }
//    }
//
//    static var didFinishOnboarding: Bool {
//        get { return Defaults[.didFinishOnboarding] }
//        set { Defaults[.didFinishOnboarding] = newValue }
//    }
//
//    static var shouldShowNotificationAlert: Bool {
//        get { return Defaults[.shouldShowNotificationAlert] }
//        set { Defaults[.shouldShowNotificationAlert] = newValue }
//    }
//
//    static var bedtimeString: String {
//        get { return Defaults[.bedtimeString] }
//        set { Defaults[.bedtimeString] = newValue }
//    }
//
//    static var didInitialLaunch: Bool {
//        get { return Defaults[.didInitialLaunch] }
//        set { Defaults[.didInitialLaunch] = newValue }
//    }
//
//    static var fcmToken: String? {
//        get { return Defaults[.fcmToken] }
//        set { Defaults[.fcmToken] = newValue }
//    }
//}
