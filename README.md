# An Observer Design Pattern Example
This repo consists of a simple iOS sample application for the Observer design pattern.
Observers are notified of events via [Notification](https://developer.apple.com/documentation/foundation/notification) and are registered via [NotificationCenter](https://developer.apple.com/documentation/foundation/notificationcenter).

<p align="center">
 ### Screenshots

<img src="https://github.com/josh-marasigan/ObserverDesignExample/blob/master/AppExample.gif" width="375" height="667" />
 </p>
 
## Dependencies
This sample app does require SnapKit for auto layout. So please install via cocoapod prior to building.

If you don't have cocoapods, run the following:

`sudo gem install cocoapods`

Then, change to the current project directory:

`cd <YOUR PATH TO THE PROJECT DIRECTORY>/observer-example`

(If you are unsure of where the directory is, look for the directory in which the Podfile resides and this is where you'll want to be)

Lastly run:

`pod install`

### Credits:
  * Huge thanks to [this awesome video tutorial](https://youtu.be/srqiDnLEocA) by Sean Allen
