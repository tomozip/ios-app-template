//
//  UserCellReactor.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/08.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import ReactorKit
import RxSwift

final class UserCellReactor: Reactor {
    enum Action {
        case load
        case reload
    }

    enum Mutation {
        case updatePremiumPlan(Bool)
        case setShouldShowModal(Bool)
    }

    struct State {
        var isShowingInitialLoading: Bool
        var shouldShowSubscriptionModal: Bool
    }

    let initialState: State

    init() {
        initialState = State(isShowingInitialLoading: true,
                             shouldShowSubscriptionModal: false
        )
    }

//    func mutate(action: UserCellReactor.Action) -> Observable<UserCellReactor.Mutation> {
//
//    }
//
//    func reduce(state: UserCellReactor.State, mutation: UserCellReactor.Mutation) -> UserCellReactor.State {
//
//    }
}
