//
//  ImagePrefetcher.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/10.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import Foundation
import Kingfisher

struct Prefetcher {

    static func prefetch(urls: [URL]) {
        let prefetcher = ImagePrefetcher(urls: urls) {
            skippedResources, failedResources, completedResources in
            print("These resources are skipped: \(skippedResources)")
            print("These resources are failed: \(failedResources)")
            print("These resources are prefetched: \(completedResources)")
        }
        prefetcher.start()
    }

    static func initialPreFetch() {
        prefetch(urls: initialURLs)
    }

    static let initialURLs: [URL] = [
        OnboardingModalViewController.Const.mockImageURL
    ]
}
