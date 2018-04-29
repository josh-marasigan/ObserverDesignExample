//
//  TitleAndTextView.swift
//  observer-example
//
//  Created by Josh Marasigan on 4/28/18.
//  Copyright © 2018 Josh Marasigan. All rights reserved.
//

import SnapKit

class TitleAndTextView: UIView {

    // MARK: - Class Properties. Fun fact: emojis are just stirng literals
    private let titleLabel = UILabel()
    private let emoji = UILabel()
    private var subTitleLabel = UILabel()

    // MARK: - Init
    // The call to `configUI()` is what actually sets up our screen's components w/ auto layout
    init() {
        super.init(frame: .zero)
        self.configObservers()
        self.configUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // Initialize Observers
    private func configObservers() {
        let tealNotificationName = Notification.Name(rawValue: ObserverKeys.teal)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(changeSubTitleToTeal(notification:)),
            name: tealNotificationName,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(changeEmojiAccordingToTeal(notification:)),
            name: tealNotificationName,
            object: nil
        )

        let pinkNotificationName = Notification.Name(rawValue: ObserverKeys.pink)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(changeSubTitleToPink(notification:)),
            name: pinkNotificationName,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(changeEmojiAccordingToPink(notification:)),
            name: pinkNotificationName,
            object: nil
        )
    }

    // MARK: - Auto Layout
    private func configUI() {
        self.backgroundColor = .clear

        emoji.text = "🗽"
        emoji.font = emoji.font.withSize(40)

        titleLabel.text = "Background Color..."
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .white

        subTitleLabel.text = "Teal"
        subTitleLabel.font = UIFont.boldSystemFont(ofSize: 120)
        subTitleLabel.textColor = .white

        self.addSubview(emoji)
        emoji.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
        }

        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emoji.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
        }

        self.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    // Don't forget to remove and de-allocate your observers
    // If not, they will be perpetually listening for notifications
    deinit { NotificationCenter.default.removeObserver(self) }

    // MARK: - Actions
    @objc func changeSubTitleToTeal(notification: Notification) {
        self.subTitleLabel.text = "Teal"
    }

    @objc func changeEmojiAccordingToTeal(notification: Notification) {
        self.emoji.text = "🗽"
    }

    @objc func changeSubTitleToPink(notification: Notification) {
        self.subTitleLabel.text = "Pink"
    }

    @objc func changeEmojiAccordingToPink(notification: Notification) {
        self.emoji.text = "💕"
    }
}
