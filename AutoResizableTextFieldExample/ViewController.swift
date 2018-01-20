//
//  ViewController.swift
//  AutoResizableTextFieldExample
//
//  Created by Anton Efimenko on 20.01.2018.
//  Copyright © 2018 Anton Efimenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var topTextView: UITextView!
	@IBOutlet weak var bottomTextView: UITextView!
	@IBOutlet weak var scrollView: UIScrollView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		topTextView.textContainerInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
		bottomTextView.textContainerInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
		scrollView.alwaysBounceVertical = true
		scrollView.keyboardDismissMode = .onDrag
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow),
											   name: NSNotification.Name.UIKeyboardWillShow,
											   object: nil)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide),
											   name: NSNotification.Name.UIKeyboardWillHide,
											   object: nil)
	}
	
	@objc func keyboardWillShow(notification: Notification) {
		let inset = scrollView.contentInset
		scrollView.contentInset = UIEdgeInsets(top: inset.top, left: inset.left, bottom: notification.keyboardHeight() + 25, right: inset.right)
	}
	
	@objc func keyboardWillHide(notification: Notification) {
		let inset = scrollView.contentInset
		scrollView.contentInset = UIEdgeInsets(top: inset.top, left: inset.left, bottom: 0, right: inset.right)
	}
	
	
}

extension Notification {
	func keyboardHeight() -> CGFloat {
		return (userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
	}
}
