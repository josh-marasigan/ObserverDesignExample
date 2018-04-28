//
//  ViewController.swift
//  observer-example
//
//  Created by Josh Marasigan on 4/28/18.
//  Copyright © 2018 Josh Marasigan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Properties
    private let menuScreen = TitleAndTextView()
    private let changeBackgroundButton = UIButton()

    private let teal = UIColor(red: 0.00, green: 0.66, blue: 0.67, alpha: 1.0)
    private let pink = UIColor(red: 0.7686, green: 0.3137, blue: 0.502, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }

    // MARK: - Init
    convenience init() {
        self.init(nibName:nil, bundle:nil)
    }

    // MARK: - Auto Layout
    private func configUI() {
        self.view.backgroundColor = teal

        self.changeBackgroundButton.setTitle("Change Color", for: .normal)
        self.changeBackgroundButton.setTitleColor(UIColor.white, for: .normal)
        self.changeBackgroundButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.changeBackgroundButton.backgroundColor = UIColor.gray
        self.changeBackgroundButton.addTarget(self, action: #selector(changeBackgroundButtonAction), for: .touchUpInside)
        self.changeBackgroundButton.addTarget(self, action: #selector(changeButtonBackgroundShade), for: .touchDown)

        self.view.addSubview(menuScreen)
        self.view.addSubview(changeBackgroundButton)

        self.menuScreen.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
        }

        self.changeBackgroundButton.snp.makeConstraints { (make) in
            make.height.equalTo(64)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-16)
        }
    }

    // MARK: - Button Action
    @objc func changeBackgroundButtonAction(sender: UIButton!) {
        // Set Button Color back to normal on user's release of the button
        self.changeBackgroundButton.backgroundColor = UIColor.gray

        // Condition to check to see if the current background is teal
        let isBackgroundTeal = (self.view.backgroundColor == teal)

        // First, we simply toggle the background color between pink or teal
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = (isBackgroundTeal) ? self.pink : self.teal
        })

        // Then we set the notification name. This will allow the observers who care about this event that the event is occuring.
        // (Observer keys are unique identifiers used to distinguish events from one another)
        // We also check if the current background is colored teal, and if so, send an event to change it to pink. If not, then send an event to change it to teal
        let notificationIdentifier = (isBackgroundTeal) ?
            Notification.Name(rawValue: ObserverKeys.pink) :
            Notification.Name(rawValue: ObserverKeys.teal)

        // Post the notification informing any observers listening to this event (indicated by its name) that an event had occured.
        // If an observer registered to listen for an event with name 'notificationIdentifier', then they will receive this notification
        NotificationCenter.default.post(name: notificationIdentifier, object: nil)
        dismiss(animated: true, completion: nil)
    }

    @objc func changeButtonBackgroundShade(sender: UIButton!) {
        // Set the Button Color temporarily dark on user's initial press of the button
        self.changeBackgroundButton.backgroundColor = UIColor.darkGray
    }
}

