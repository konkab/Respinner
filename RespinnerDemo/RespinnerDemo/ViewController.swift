//
//  ViewController.swift
//  RespinnerDemo
//
//  Created by Konstantin Kabanov on 09/02/15.
//  Copyright (c) 2015 Konstantin Kabanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let respinner = Respinner(spinningView: UIImageView(image: UIImage(named: "refresh-spinner")))
		respinner.scrollViewDefaultContentInset = UIEdgeInsets(top: 64.0, left: 0.0, bottom: 0.0, right: 0.0)
		respinner.addTarget(self, action: "respinnerValueChanged:", forControlEvents: .ValueChanged)
		tableView.addSubview(respinner);
	}
	
	func respinnerValueChanged(sender: Respinner) {
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
			sender.endRefreshing()
		}
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 50
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("BasicTableViewCell", forIndexPath: indexPath) as UITableViewCell
		cell.textLabel?.text = "Row \(indexPath.row)"
		
		return cell
	}
}

