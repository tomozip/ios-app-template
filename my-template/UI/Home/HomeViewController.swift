//
//  HomeViewController.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/08.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import ReactorKit
import ReusableKit
import RxSwift
import Then
import UIKit
import Kingfisher

final class HomeViewController: UIViewController, ReactorKitView, ViewConstructor, TransitionPresentable {
    typealias Reactor = HomeViewReactor

    struct Const {
        static let userCountViewHeight: CGFloat = 32
    }

    struct Reusable {
        static let userCell = ReusableCell<UserCell>()
    }

    // MARK: - Variables

    var disposeBag = DisposeBag()

    // MARK: - Views

    private lazy var headerView = UIView().then {
        $0.backgroundColor = Color.primaryColor
        $0.addSubview(headerTitleLabel)
    }

    private let headerTitleLabel = UILabel().then {
        $0.text = "チャット配信"
        $0.textColor = Color.primaryTextColor
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 18)
    }

    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = UserCell.Const.cellSize
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = UserCell.Const.minimumLineSpacing
        $0.minimumInteritemSpacing = UserCell.Const.minimumLineSpacing
        let margin = UserCell.Const.minimumLineSpacing
        $0.sectionInset = UIEdgeInsets(top: Const.userCountViewHeight + 36, left: margin, bottom: margin, right: margin)
    }

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.backgroundColor = .clear
        $0.alwaysBounceVertical = true
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
        $0.register(Reusable.userCell)
        $0.dataSource = self
        $0.delegate = self

    }

    private lazy var userCountView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 16
        $0.shadow()
        $0.addSubview(countPrefixLabel)
        $0.addSubview(countLabel)
        $0.addSubview(countSuffixLabel)
    }

    private let countPrefixLabel = UILabel().then {
        $0.apply(size: 12, color: Color.secondaryDarkColor)
        $0.text = "配信中"
    }

    private let countLabel = UILabel().then {
        $0.apply(isBold: true, size: 20, color: Color.primaryColor)
    }

    private let countSuffixLabel = UILabel().then {
        $0.apply(size: 12, color: Color.secondaryDarkColor)
        $0.text = "人"
    }

    //    private let loadingCollectionView = HomeLoadingView(frame: .zero)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupViewConstraints()
        setupButtons()
        setupGestureRecognizers()
        setupFunctions()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

//        let inset = view.safeAreaInsets.top + Const.moonImageSize + 30
//        if collectionView.contentInset.top != inset {
//            collectionView.contentInset.bottom = view.safeAreaInsets.bottom
//            collectionView.contentInset.top = inset
//            collectionView.contentOffset.y = -inset
//        }
    }

    // MARK: - Setup Methods

    func setupViews() {
        view.backgroundColor = Color.bg

        view.addSubview(headerView)
        view.addSubview(collectionView)
        view.addSubview(userCountView)
//        view.addSubview(loadingCollectionView)
    }

    func setupViewConstraints() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(64)
        }
        headerTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-14)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.right.bottom.left.equalToSuperview()
        }
        userCountView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Const.userCountViewHeight)
            $0.width.equalTo(countLabel.snp.width).offset(58 + 32)
        }
        countPrefixLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        countLabel.snp.makeConstraints {
            $0.left.equalTo(countPrefixLabel.snp.right).offset(4)
            $0.centerY.equalToSuperview()
        }
        countSuffixLabel.snp.makeConstraints {
            $0.left.equalTo(countLabel.snp.right).offset(4)
            $0.centerY.equalToSuperview()
        }
    }

    func setupButtons() {}

    func setupGestureRecognizers() {}

    private func setupFunctions() {
        collectionView.rx.itemSelected
            .map { [weak self] indexPath in self?.reactor?.currentState.users[indexPath.item] }
            .filterNil()
            .bind { [weak self] user in
                self?.showUserPage(user: user)
            }
            .disposed(by: disposeBag)
    }

    // MARK: - Bind

    func bind(reactor: HomeViewReactor) {
        // Action
        reactor.action.onNext(.load)

        // State
        reactor.state.map { $0.users }
            .filter { !$0.isEmpty }
            .bind { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .disposed(by: disposeBag)

        reactor.state.map { $0.users.count.description }
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)

        reactor.state.map { $0.shouldPresentOnboarding }
            .filter { $0 }
            .bind { [weak self] _ in
                self?.showOnboardingModal()
            }
            .disposed(by: disposeBag)

//        reactor.state.map { $0.isShowingInitialLoading }
//            .filter { !$0 }
//            .map { _ in }
//            .take(1)
//            .observeOn(MainScheduler.instance)
//            .bind(onNext: loadingCollectionView.removeTransition)
//            .disposed(by: disposeBag)
    }

//    private func presentSubscritptionModal() {
//        guard let reactor = reactor else { return }
//        let subscriptionReactor = reactor.reactorForSubscriptionModal()
//        let subscriptionModalView: SubscriptionModalViewController = .instantiate()
//        subscriptionModalView.reactor = subscriptionReactor
//
//        let navigationCotroller = UINavigationController(rootViewController: subscriptionModalView)
//
//        navigationController?.present(navigationCotroller, animated: true)
//    }

    private func showUserPage(user: User) {
        let userPageViewController = UserPageViewController().then {
            $0.reactor = UserPageViewReactor(user: user)
        }

        navigationController?.pushViewController(userPageViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reactor?.currentState.users.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let user = reactor?.currentState.users[indexPath.item] else { fatalError() }

        return collectionView.dequeue(Reusable.userCell, for: indexPath).then {
            $0.setupUserInfo(user: user)
        }
    }
}
