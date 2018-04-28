//
//  TitleAndTextView.swift
//  observer-example
//
//  Created by Josh Marasigan on 4/28/18.
//  Copyright © 2018 Josh Marasigan. All rights reserved.
//

import SnapKit

class TitleAndTextView: UIView {

    // MARK: - Properties
    private let titleLabel = UILabel()
    private var subTitleLabel = UILabel()

    // MARK: - Init
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
        NotificationCenter.default.addObserver(self, selector: #selector(changeSubTitleToTeal(notification:)), name: tealNotificationName, object: nil)

        let pinkNotificationName = Notification.Name(rawValue: ObserverKeys.pink)
        NotificationCenter.default.addObserver(self, selector: #selector(changeSubTitleToPink(notification:)), name: pinkNotificationName, object: nil)
    }

    // MARK: - Auto Layout
    private func configUI() {
        self.backgroundColor = .clear

        titleLabel.text = "Background Color..."
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.textColor = .white

        subTitleLabel.text = "Teal"
        subTitleLabel.font = UIFont.boldSystemFont(ofSize: 120)
        subTitleLabel.textColor = .white

        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
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
        UIView.animate(withDuration: 0.3, animations: {
            self.subTitleLabel.text = "Teal"
        })
    }

    @objc func changeSubTitleToPink(notification: Notification) {
        UIView.animate(withDuration: 0.3, animations: {
            self.subTitleLabel.text = "Pink"
        })
    }
}
