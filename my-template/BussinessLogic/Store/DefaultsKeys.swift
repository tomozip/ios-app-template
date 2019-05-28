//
//  DefaultsKyes.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/08.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import SwiftyUserDefaults

extension DefaultsKeys {
    static let user = DefaultsKey<Data?>("user", defaultValue: nil)
    static let didFinishOnboarding = DefaultsKey<Bool>("didFinishOnboarding", defaultValue: false)
    static let shouldShowNotificationAlert = DefaultsKey<Bool>("shouldShowNotificationAlert", defaultValue: true)
    static let bedtimeString = DefaultsKey<String>("bedtimeString", defaultValue: "22:00")
    static let didInitialLaunch = DefaultsKey<Bool>("didInitialLaunch", defaultValue: false)
    static let fcmToken = DefaultsKey<String?>("fcmToken", defaultValue: nil)

    // MARK: For subscription

    static let subscriptionIsTrial = DefaultsKey<Bool>("subscriptionIsTrial", defaultValue: false)
//    static let subscriptionExpiredDate = DefaultsKey<Int>("subscriptionExpiredDate",
//                                                          defaultValue: Date(timeIntervalSince1970: 0).timestamp)
}
