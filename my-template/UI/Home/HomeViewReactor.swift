//
//  HomeViewReactor.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/08.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import ReactorKit
import RxSwift

protocol HomeContentReactor {}

final class HomeViewReactor: Reactor {
    enum Action {
        case load
    }

    enum Mutation {
        case setShouldPresentOnboarding
    }

    struct State {
        var users: [User]
        var shouldPresentOnboarding: Bool
    }

    let initialState: State

    init() {
        initialState = State(
            users: User.mockData,
            shouldPresentOnboarding: false
        )
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .load:
            return Observable.just(Mutation.setShouldPresentOnboarding).delay(0.8, scheduler: MainScheduler.instance)
//        case .reload:
//            return .just(Mutation.setShouldShowModal(true))
//        case let .showSubscription(shouldShow):
//            return .just(Mutation.setShouldShowModal(shouldShow))
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setShouldPresentOnboarding:
            state.shouldPresentOnboarding = true
//
//        case let .setShouldShowModal(shouldShow):
//            state.shouldShowSubscriptionModal = shouldShow
        }
        return state
    }

//    private func loadMainProgramPlaylists() -> Observable<[Playlist]> {
//        guard let userID = UserStore.user?.id else { return .empty() }
//        return PlaylistRepository.listPlaylists(userID: userID, categoryType: .home).asObservable()
//    }
//
//    func reactorForSubscriptionModal() -> SubscriptionModalReactor {
//        return SubscriptionModalReactor(provider: provider)
//    }
//
//    func reactorForPlaylist(playlist: Playlist, currentTrackIndex: Int) -> PlaylistReactor {
//        return PlaylistReactor(playlist: playlist, currentTrackIndex: currentTrackIndex, provider: provider)
//    }
}
