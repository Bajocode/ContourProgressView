<p align="center">
    <img src="RepoMedia/example.gif" width="200" max-width="50%" />
</p>

<p align="center">
    <a href="https://cocoapods.org/pods/ContourProgressView">
        <img src="https://img.shields.io/cocoapods/v/SquishButton.svg" alt="CocoaPods" />
    </a>
    <a href="http://cocoapods.org/pods/SquishButton">
        <img src="https://img.shields.io/cocoapods/l/SquishButton.svg?style=flat" alt="License" />
    </a>
    <a href="http://cocoapods.org/pods/SquishButton">
        <img src="https://img.shields.io/cocoapods/p/SquishButton.svg?style=flat" alt="Platform" />
    </a>
    <a href="https://twitter.com/FBajo">
        <img src="https://img.shields.io/badge/contact-@FBajo-blue.svg?style=flat" alt="Twitter: @FBajo" />
    </a>
</p>

## About
`ContourProgressView` depicts the progress of a task over time by following the edges of a view.

## Usage with Storyboard
Drag a UIView onto the canvas and connect it to the `ContourProgressView` Class in the
Identity Inspector. Make sure to set the module to `ContourProgressView` and adjust properties in the Attribute Inspector to manage the design.
<p align="center">
    <img src="RepoMedia/StoryBoardSetup.png" width=100% />
</p>

## Usage with Code
```swift
let rectProgressView = ContourProgressView(frame: view.bounds, isRect: true)
rectProgressView.progress = totalBytesWritten / totalBytesExpectedToWrite
```

## Customization
```swift
public var isRect: Bool = true                      // The shape of the progress line (rect or oval)
public var isLineCapSquared: Bool = true            // The shape of the endpoints of the progress line (squared or rounded)
public var lineWidth: CGFloat = 2.0                 // The line width of both the track and progress line
public var progressTintColor: UIColor = .black      // The color of the progress line
public var trackTintColor: UIColor = .lightGray     // The color of the underlying 'track' line
```

## Requirements
iOS 8.0 and Swift 3.0.

## Installation

### CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C and Swift, which automates and simplifies the process of using 3rd-party
libraries like `ContourProgressView` in your projects. First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod 'ContourProgressView'
```

Second, install `ContourProgressView` into your project:

```ruby
pod install
```

### Manually

* Drag the `ContourProgressView/ContourProgressView` folder into your project.
* Take care that `ContourProgressView.bundle` is added to `Targets->Build Phases->Copy Bundle Resources`.

## Author

I'm [Fabijan Bajo](http://www.fabijanbajo.com).
Email: [bajo09@gmail.com](mailto:bajo09@gmailcom)
Twitter: [@FBajo](http://twitter.com/FBajo).

## License

`ContourProgressView` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
