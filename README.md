# An Observer Design Pattern Example
This repo consists of a simple iOS sample application for the Observer design pattern.
Observers are notified of events via [Notification](https://developer.apple.com/documentation/foundation/notification) and are registered via [NotificationCenter](https://developer.apple.com/documentation/foundation/notificationcenter).

## Guide
 * This project was made for the purpose of explaining the main concepts within a simple Swift implementation of the Observer Pattern.
 * Please refer to [the associated article](https://medium.com/@joshmarasigan/the-beacons-are-lit-an-observer-design-pattern-guide-in-swift-8089bf1310cf) to find out how it was made and why it was made the way it is.

<p style="font-size:25px;" align="center"><strong> Screenshots </strong></p><br>
<p align="center"><br><br>
<img src="https://github.com/josh-marasigan/ObserverDesignExample/blob/master/AppExample.gif" width="375" height="667" />
</p>
 
## Diagram

We’ll have a button (Subject) that will be notifying an Observer (an arbitrary view containing some labels) of it’s changes. 
In order for the view to receive notifications from this button, it will have to first subscribe to it.

To do this, we will be using the Notifications Framework to subscribe objects to one another 
and to send Notifications/events from one object to the other.

<p align="center">
 <img src="https://i.imgur.com/0vsuLkS.png" width="250" height="580" />
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
