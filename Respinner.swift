//
//  Respinner.swift
//
//	The MIT License (MIT)
//
//	Copyright (c) 2015 Konstantin Kabanov
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//	SOFTWARE.

import UIKit

public class Respinner: UIControl {
	var animationDuration = 2.0
	var scrollViewDefaultContentInset = UIEdgeInsetsZero
	private var spinningView: UIView!
	private var height: CGFloat!
    private (set) public var refreshing: Bool = false
	private var previousYOffset = CGFloat(0.0)
	
	convenience init(spinningView: UIView) {
		self.init(spinningView: spinningView, height: 60.0)
	}
	
	init(spinningView: UIView, height: CGFloat) {
		super.init(frame: CGRectZero)
		
		self.spinningView = spinningView
		self.height = height
		autoresizingMask = .FlexibleWidth
		backgroundColor = UIColor.clearColor()
		addSubview(spinningView)
	}
	
	private override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required public init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	override public func didMoveToSuperview() {
		super.didMoveToSuperview()
		
		if let scrollView = self.superview as? UIScrollView {
			frame = CGRect(x: 0.0, y: -height, width: scrollView.frame.size.width, height: height)
			
			scrollView.addObserver(self, forKeyPath: "contentOffset", options: .Initial, context: nil)
		}
	}
	
	override public func layoutSubviews() {
		super.layoutSubviews()

		spinningView.center = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
	}
	
	override public func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
		let scrollView = self.superview as! UIScrollView
		
		if object as? UIScrollView == scrollView {
			if keyPath == "contentOffset" {
				var yOffsetWithoutInsets = scrollView.contentOffset.y + scrollViewDefaultContentInset.top
				
				if yOffsetWithoutInsets < -frame.size.height {
					if !scrollView.dragging && !refreshing {
						beginRefreshing()
						
						sendActionsForControlEvents(.ValueChanged)
					} else if !refreshing {
						spinningView.transform = CGAffineTransformMakeRotation(-(yOffsetWithoutInsets / frame.size.height) * 2.0 * CGFloat(M_PI))
					}
				} else if !refreshing {
					spinningView.transform = CGAffineTransformMakeRotation(-(yOffsetWithoutInsets / frame.size.height) * 2.0 * CGFloat(M_PI))
				}
				
				previousYOffset = scrollView.contentOffset.y
			}
		}
	}
	
	func beginRefreshing() {
		refreshing = true
		
		let animation = CABasicAnimation()
		animation.keyPath = "transform.rotation.z"
		animation.duration = animationDuration
		animation.removedOnCompletion = false
		animation.fillMode = kCAFillModeForwards
		animation.repeatCount = Float.infinity
		animation.additive = true
		animation.fromValue = CGFloat(0.0)
		animation.toValue = CGFloat(2.0 * M_PI)
		
		spinningView.layer.addAnimation(animation, forKey: "rotate")
		
		let scrollView = self.superview as! UIScrollView
		scrollView.contentOffset.y = previousYOffset
		
		UIView.animateWithDuration(0.3, delay: 0.0, options: .AllowUserInteraction, animations: { () -> Void in
			scrollView.contentInset.top += self.frame.size.height
			scrollView.contentOffset.y = -scrollView.contentInset.top
		}, completion: nil)
	}
	
	func endRefreshing() {
		refreshing = false
		
		spinningView.layer.removeAnimationForKey("rotate")
		
		let scrollView = self.superview as! UIScrollView
		
		UIView.animateWithDuration(0.3, delay: 0.0, options: .AllowUserInteraction, animations: { () -> Void in
			scrollView.contentInset = self.scrollViewDefaultContentInset
		}, completion: nil)
	}
}
