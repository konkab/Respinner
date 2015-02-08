# SpinningRefreshControl
SpinningRefreshControl is a drop in replacement for UIRefreshControl that spins custom UIView inside while scrolling based on contentOffset of UIScrollView. Allows you to use custom spinning view, custom control height, etc.

## Installation
Drop in the SpinningRefreshControl.swift to your Xcode project.

Or via CocoaPods pre-release:
`pod 'SpinningRefreshControl', '~> 1.0.0'`

## Usage with Code
SpinningRefreshControl works the same as UIRefreshControl. After initialization just add it as subview to a UIScrollView.

    refreshControl = SpinningRefreshControl()
	refreshControl.spinningView = UIImageView(image: UIImage(named: "refresh-spinner"))
	refreshControl.animationDuration = 1.5
	refreshControl.addTarget(self, action: "refreshControlValueChanged:", forControlEvents: .ValueChanged)
	tableView.addSubview(refreshControl)

## Known issues
SpinningRefreshControl doesn't take in consideration content insets of scroll view. If your UIScrollView has non-zero content insets, before adding SpinningRefreshControl as a subview, provide it content insent, which uses UIScrollView.

	refreshControl = SpinningRefreshControl()
	refreshControl.spinningView = UIImageView(image: UIImage(named: "refresh-spinner"))
	refreshControl.animationDuration = 1.5
	refreshControl.scrollViewDefaultContentInset = UIEdgeInsetsMake(108.0, 0.0, 49.0, 0.0)
	refreshControl.addTarget(self, action: "refreshControlValueChanged:", forControlEvents: .ValueChanged)
	tableView.addSubview(refreshControl)

## License
SpinningRefreshControl is released under the MIT license. See LICENSE for details.