# MoviesChecker

That is a simple app to list upcoming movies with some valuable infos

## Getting Started

Basic instructions to running

### Prerequisites

To run it is necessary to have Ruby installed and add the Cocoapods gem

### Installing
Installing Cocoapods

```
$ sudo gem install cocoapods
```

**Note: Run this command in the folder that contains the Podfile file**

```
$ pod install
```
## Running the project
After the cocoapods installation process is finished, open the project in Xcode.

**Use this file ->**  `MoviesChecker.xcworkspace`

Note: To use CocoaPods it creates a workspace with the project and a project only with the pods.


## Built With

* [Alamofire](https://github.com/Alamofire/Alamofire) - Elegant HTTP Networking in Swift
* [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper) - Simple JSON Object mapping written in Swift
* [AlamofireObjectMapper](https://github.com/tristanhimmelman/AlamofireObjectMapper) - An extension to Alamofire and ObjectMapper.
* [Kingfisher](https://github.com/onevcat/Kingfisher) - A lightweight, pure-Swift library for downloading and caching images.
* [Cocoapods](https://cocoapods.org/) - Dependency manager

## Authors
* **Wagner Santos** - *Initial work* - [oswagner](https://github.com/oswagner)

## Comments on the challenge

I've tried to work as best I could with an abstracting a layer of services where I make calls to the api.
I've created a response abstraction to handle generic responses to all API responses using the enum Result and also created a helper to define the endpoints opens in a location in case it is necessary to change;

I've used some libraries to help me::
- Alamofire
- ObjectMapper
- AlamofireObjectMapper
- Kingfisher

I've chosen to use the Alamofire + ObjectMapper + AlamofireObjectMapper for the convenience of handling responses and mapping to models, since I had already worked with them and since I did not have much contact with the new Codable API I felt safer using them. But from what I ended up researching and seeing from examples I believe that it would not be necessary to use these libraries.

I've chosen Kingfisher because it's simple to use and powerful to optimize image downloads.

And to manage these libraries, I've used Cocoapods as it is the simplest and quickest way to add and manage libraries, although it is a bit intrusive in the project.


### Points to improve:

Unfortunately, I forgot to measure my time to add unit test and functional tests. I really believe that's a good practice. Sorry, for delivery an app without tests.

About my UI/UX that's not my best skill I've tried to make something similar to other apps related to movies. I've tried something darker, and I did my own images. I proud of it I'm improving my Sketch skills.

As I mentioned, I believe that using the ObjectMapper can be replaced with the native solution.

