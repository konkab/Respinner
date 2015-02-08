# SpinningRefreshControl
SpinningRefreshControl is a drop in replacement for UIRefreshControl that spins custom UIView inside while scrolling based on contentOffset of UIScrollView. Allows you to use custom spinning view, custom height, etc.

## Installation
Drop in the SpinningRefreshControl.swift to your Xcode project.

Or via CocoaPods pre-release:
`pod 'SpinningRefreshControl', '~> 1.0.0'`

## Usage
SpinningRefreshControl works the same as UIRefreshControl. After initialization just add it as subview to a UIScrollView, everything else it will manage itself.

    var refreshControl = SpinningRefreshControl()
	refreshControl.spinningView = UIImageView(image: UIImage(named: "refresh-spinner"))
	refreshControl.addTarget(self, action: "refreshControlValueChanged:", forControlEvents: .ValueChanged)
	tableView.addSubview(refreshControl)

Everything you can do with UIRefreshControl you can do with SpinningRefreshControl.

## Known issues
SpinningRefreshControl doesn't take in consideration content insets of scroll view. If your UIScrollView has non-zero content insets, before adding SpinningRefreshControl as a subview, provide it content insets, which uses UIScrollView.

	var refreshControl = SpinningRefreshControl()
	refreshControl.spinningView = UIImageView(image: UIImage(named: "refresh-spinner"))
	refreshControl.scrollViewDefaultContentInset = UIEdgeInsetsMake(108.0, 0.0, 49.0, 0.0)
	refreshControl.addTarget(self, action: "refreshControlValueChanged:", forControlEvents: .ValueChanged)
	tableView.addSubview(refreshControl)

## License
SpinningRefreshControl is released under the MIT license. See LICENSE for details.