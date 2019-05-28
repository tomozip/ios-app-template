//
//  UserCell.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/08.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import Kingfisher
import RxSwift
import Then
import SnapKit
import UIKit

final class UserCell: UICollectionViewCell, ViewConstructor {

    struct Const {
        static let cellSize = CGSize(width: 165, height: 200)
        static let minimumLineSpacing: CGFloat = 15
        static let loginStatusViewSize = CGSize(width: 10, height: 10)
    }

    // MARK: Variables

    var disposeBag = DisposeBag()

    // MARK: - Views

    private lazy var userImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 8
        $0.addSubview(watchingCountView)
    }

    private lazy var watchingCountView = UIView().then {
        $0.backgroundColor = Color.shadow
        $0.layer.cornerRadius = 4
        $0.addSubview(eyeImageView)
        $0.addSubview(watchingCountLabel)
    }

    private let eyeImageView = UIImageView().then {
        $0.image = R.image.eye()?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .white
    }

    private let watchingCountLabel = UILabel().then {
        $0.apply(isBold: true, size: 12, color: .white)
    }

    private let loginStatusView = UIView().then {
        $0.layer.cornerRadius = Const.loginStatusViewSize.width / 2
        $0.backgroundColor = Color.green
    }

    private let ageLocationLabel = UILabel().then {
        $0.apply(isBold: true, size: 11, color: Color.primaryColor)
    }

    private let bioLabel = UILabel().then {
        $0.apply(size: 11, color: Color.secondaryDarkColor)
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupViewConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Methods

    func setupViews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(loginStatusView)
        contentView.addSubview(ageLocationLabel)
        contentView.addSubview(bioLabel)
    }

    func setupViewConstraints() {
        userImageView.snp.makeConstraints {
            $0.top.right.left.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(userImageView.snp.width)
        }
        watchingCountView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-4)
            $0.right.equalToSuperview().offset(-4)
            $0.height.equalTo(20)
            $0.width.equalTo(watchingCountLabel.snp.width).offset(30)
        }
        eyeImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(6)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 12, height: 12))
        }
        watchingCountLabel.snp.makeConstraints {
            $0.left.equalTo(eyeImageView.snp.right).offset(6)
            $0.centerY.equalToSuperview()
        }
        loginStatusView.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(7)
            $0.size.equalTo(Const.loginStatusViewSize)
        }
        ageLocationLabel.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.left.right.equalToSuperview().inset(22)
            $0.top.equalTo(userImageView.snp.bottom).offset(7)
        }
        bioLabel.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(ageLocationLabel.snp.bottom).offset(5)
        }
    }

    func setupButtons() {}

    func setupGestureRecognizers() {}

    // MARK: - Bind

    func setupUserInfo(user: User) {
        let URLString = user.pictures[0].URLString
        userImageView.kf.setImage(with: URL(string: URLString))
        watchingCountLabel.text = user.audienceCount.description
        ageLocationLabel.text = "\(user.age)歳・\(user.location)"
        bioLabel.text = user.bio
    }

    // MARK: - Override Methods

    override func prepareForReuse() {
        super.prepareForReuse()

        userImageView.image = nil
        ageLocationLabel.text = ""
        bioLabel.text = ""
    }
}
