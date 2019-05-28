//
//  OnboardingModalViewController.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/10.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import UIKit
import RxSwift

final class OnboardingModalViewController: UIViewController, ViewConstructor {

    enum Const {
        static let mockImageURL = URL(string: "https://storage.googleapis.com/ona-chat/onboarding_mockup.png")!
    }

    // MARK: - Variables

    var disposeBag = DisposeBag()

    // MARK: - Views

    private lazy var modalBodyView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.addSubview(mockImageView)
        $0.addSubview(modalTitleLabel)
        $0.addSubview(modalDismissButton)
    }

    private let mockImageView = UIImageView().then {
        $0.kf.setImage(with: Const.mockImageURL)
    }

    private let modalTitleLabel = UILabel().then {
        $0.apply(isBold: true, size: 20, color: Color.secondaryDarkColor)
        $0.text = "１タップですぐ視聴！！"
    }

    private let modalDismissButton = UIButton().then {
        $0.backgroundColor = Color.primaryColor
        $0.layer.cornerRadius = 4
        $0.setTitle(color: .white, fontSize: 18, text: "女の子を選ぶ")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupViewConstraints()
        setupButtons()
        setupGestureRecognizers()
    }

    // MARK: - Setup Methods

    func setupViews() {
        view.backgroundColor = .init(hex: "000000", alpha: 0.3)

        view.addSubview(modalBodyView)
    }

    func setupViewConstraints() {
        modalBodyView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: 335, height: 478))
        }
        modalTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        mockImageView.snp.makeConstraints {
            $0.top.equalTo(modalTitleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 190, height: 338))
        }
        modalDismissButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 190, height: 42))
        }

    }

    func setupButtons() {
        modalDismissButton.rx.tap.map(didTapModalDismissButton).subscribe().disposed(by: disposeBag)
    }

    func setupGestureRecognizers() {}

    private func didTapModalDismissButton() {
        dismiss(animated: true)
    }
}
