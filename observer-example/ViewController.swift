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

    // MARK: - Class Properties
    private let titleAndTextView = TitleAndTextView()
    private let changeBackgroundButton = UIButton()

    // MARK: - Color instances we're using (super arbitrary, you can totally just use the system ones)
    private let teal = UIColor(red: 0.00, green: 0.66, blue: 0.67, alpha: 1.0)
    private let pink = UIColor(red: 0.7686, green: 0.3137, blue: 0.502, alpha: 1.0)
    private let offBlack = UIColor(red: 0.2078, green: 0.2, blue: 0.1961, alpha: 1.0)

    // MARK: - View Controller Life Cycle
    // The call to `configUI()` is what actually sets up our screen's components w/ auto layout
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
        // Initializing our background color to teal on this view's first load
        self.view.backgroundColor = teal

        /*
         Here we are just configuring our main button's UI
         This is also where we set our selectors for the actions
         this button will call with the apporpriate UIControlEvents
         (in this case `touchUpInside` and `touchDown`)
         */
        self.configChangeBackgroundButtonUI()

        /*
         We now add our main two components:
         - titleAndTextView (UIView)
         - changeBackgroundButton (UIButton)
         to this UIViewController's main view
        */
        self.view.addSubview(titleAndTextView)
        self.view.addSubview(changeBackgroundButton)

        /*
         We are centering the titleAndTextView to the superview's (ViewController's view) center.
         We also set it's width to 85% of the super view's
        */
        self.titleAndTextView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
        }

        /*
         We explicitly set the changeBackgroundButton height to 52 points,
         height to 85% of the superview, and set it's center to the superview's center.
         Lastly we pin it's bottom to the top of this ViewController's view's bottom layout guide
         */
        self.changeBackgroundButton.snp.makeConstraints { (make) in
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-16)
        }
    }

    // MARK: - Button Configuration
    private func configChangeBackgroundButtonUI() {
        self.changeBackgroundButton.setTitle("Switch", for: .normal)
        self.changeBackgroundButton.setTitleColor(UIColor.white, for: .normal)
        self.changeBackgroundButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.changeBackgroundButton.backgroundColor = self.offBlack
        self.changeBackgroundButton.addTarget(self, action: #selector(changeBackgroundButtonAction), for: .touchUpInside)
        self.changeBackgroundButton.addTarget(self, action: #selector(changeButtonBackgroundShade), for: .touchDown)
    }

    // MARK: - Button Action
    @objc func changeBackgroundButtonAction(sender: UIButton!) {
        // Set Button Color back to normal on user's release of the button
        self.changeBackgroundButton.backgroundColor = self.offBlack

        // Condition to check to see if the current background is teal
        let isBackgroundTeal = (self.view.backgroundColor == teal)

        // First, we simply toggle the background color between pink or teal
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = (isBackgroundTeal) ? self.pink : self.teal
        })

        /*
         Then we set the notification name.
         This will allow the observers who care about this event that the event is occuring.
         (Observer keys are unique identifiers used to distinguish events from one another)
         We also check if the current background is colored teal, and if so,
         send an event to change it to pink. If not, then send an event to change it to teal
        */
        let notificationIdentifier = (isBackgroundTeal) ?
            Notification.Name(rawValue: ObserverKeys.pink) :
            Notification.Name(rawValue: ObserverKeys.teal)

        /*
         Post the notification informing any observers listening to this event (indicated by its name) that an event had occured.
         If an observer registered to listen for an event with name 'notificationIdentifier',
         then they will receive this notification
         */
        NotificationCenter.default.post(name: notificationIdentifier, object: nil)
        dismiss(animated: true, completion: nil)
    }

    // Make button background temp. lighter when user presses down
    @objc func changeButtonBackgroundShade(sender: UIButton!) {
        self.changeBackgroundButton.backgroundColor = self.offBlack.withAlphaComponent(0.6)
    }
}
