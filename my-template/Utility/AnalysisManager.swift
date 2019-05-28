//
//  AnalysisManager.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/08.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import Firebase
import FirebaseAnalytics

struct AnalysisManager {
    enum Event: String {
        case openApp
        //        case graduateTrial
        //        case updateSubscription
        case clickPlaylist
        // TODO: playTrack・completePlayTrackイベントを仕込む
        case playTrack
        case completePlayTrack
        case openNotificationModal
        case clickNotificationModalAllowButton
        case clickNotificationModalDismissButton
        case allowNotification
    }

    private static func log(_ event: Event, properties: [String: Any] = [:]) {
        var properties: [String: Any] = properties

//        if let userID = UserStore.user?.id {
//            properties["user_id"] = userID
//        }

        let eventName = event.rawValue.snakenized
        Analytics.logEvent(eventName, parameters: properties)
    }
}

extension AnalysisManager {
    private enum Const {
        static let reproSDKToken = "adb783ec-29d4-4797-b227-9bd2f8bce4a6"
    }

    static func configure() {
        // setup for common environment
        FirebaseApp.configure()

        // setup for Production
//        guard Configuration.current == .production else { return }
//        Fabric.with([Answers.self])
    }

    static func setPush(deviceToken: Data) {
//        guard Configuration.current == .production else { return }
//        Repro.setPushDeviceToken(deviceToken)
    }
}

// public methods for event log
extension AnalysisManager {
    static func logOpenApp() {
        log(.openApp)
    }

    //    static func logGraduateTrial(productID: String) {
    //        log(.graduateTrial, properties: [
    //            "product_id": productID,
    //        ])
    //    }
    //
    //    static func logUpdateSubscription(productID: String) {
    //        log(.updateSubscription, properties: [
    //            "product_id": productID,
    //        ])
    //    }

    static func logClickPlaylist(playlistID: String) {
        log(.clickPlaylist, properties: [
            "playlist_id": playlistID,
            ])
    }

    static func logPlayTrack(playlistID: String, trackID: String) {
        log(.playTrack, properties: [
            "playlist_id": playlistID,
            "track_id": trackID,
            ])
    }

    static func logCompletePlayTrack(playlistID: String, trackID: String, ratio: Float) {
        log(.completePlayTrack, properties: [
            "playlist_id": playlistID,
            "track_id": trackID,
            "ratio": ratio,
            ])
    }

    static func logOpenNotificationModal() {
        log(.openNotificationModal)
    }

    static func logClickNotificationModalAllowButton() {
        log(.clickNotificationModalAllowButton)
    }

    static func logClickNotificationModalDismissButton() {
        log(.clickNotificationModalDismissButton)
    }

    static func logAllowNotification() {
        log(.allowNotification)
    }
}
