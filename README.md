# Respinner
Respinner is a drop in replacement for UIRefreshControl that rotates custom UIView inside while scrolling based on contentOffset of UIScrollView. Allows you to use custom spinning view, custom height, etc.

![video](https://cloud.githubusercontent.com/assets/1832821/6097287/224f9006-afda-11e4-9c42-734a59d3c789.gif)

## Installation
Drop in the Respinner.swift to your Xcode project.

Or via CocoaPods pre-release:
pod 'Respinner'

## Usage
Respinner works the same as UIRefreshControl. After initialization just add it as subview to a UIScrollView, everything else it will manage itself.

	let respinner = Respinner(spinningView: UIImageView(image: UIImage(named: "refresh-spinner")))
	respinner.addTarget(self, action: "respinnerValueChanged:", forControlEvents: .ValueChanged)
	tableView.addSubview(respinner);

Everything you can do with UIRefreshControl you can do with Respinner.

## Known issues
Respinner doesn't take in consideration content insets of scroll view. If your UIScrollView has non-zero content insets, before adding SpinningRefreshControl as a subview, provide it content insets, which uses UIScrollView.

	let respinner = Respinner(spinningView: UIImageView(image: UIImage(named: "refresh-spinner")))
	respinner.scrollViewDefaultContentInset = UIEdgeInsets(top: 64.0, left: 0.0, bottom: 0.0, right: 0.0)
	respinner.addTarget(self, action: "respinnerValueChanged:", forControlEvents: .ValueChanged)
	tableView.addSubview(respinner);

## License
Respinner is released under the MIT license. See LICENSE for details.