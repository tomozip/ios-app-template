//
//  TransitionPresentable.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/08.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import UIKit

protocol TransitionPresentable: class {
//    func showOnboardingModal()
//    func showBedtimePushPromoModal(transitioningDelegate: UIViewControllerTransitioningDelegate)
//    func showPlaylistPage(playlist: Playlist)
}

extension TransitionPresentable where Self: UIViewController {
//    func showOnboardingModal() {
//        let vc = OnboardingModalViewController()
//        vc.definesPresentationContext = true
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .overCurrentContext
//        present(vc, animated: true)
//    }
//
//    func showBedtimePushPromoModal(transitioningDelegate: UIViewControllerTransitioningDelegate) {
//        present(
//            BedtimePushPromoViewController().then {
//                $0.modalPresentationStyle = .custom
//                $0.transitioningDelegate = transitioningDelegate
//            },
//            animated: true,
//            completion: nil
//        )
//    }
//
//    func showPlaylistPage(playlist: Playlist) {
//        navigationController?.pushViewController(
//            PlaylistViewController().then {
//                // TODO: Set currentTrackIndex
//                $0.reactor = PlaylistReactor(playlist: playlist, currentTrackIndex: 0)
//            },
//            animated: true
//        )
//    }
}
