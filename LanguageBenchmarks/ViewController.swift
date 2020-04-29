//
//  ViewController.swift
//  LanguageBenchmarks
//
//  Created by Michael Redig on 4/28/20.
//  Copyright © 2020 Red_Egg Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var textView: UITextView!

	let swiftBenches = SwiftyBenches()
	let objcBenches = ObbyBenches()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


	@IBAction func swiftFibPressed(_ sender: UIButton) {
//		print(swiftBenches.fibSequence(nthValue: 0))
//		print(swiftBenches.fibSequence(nthValue: 1))
//		print(swiftBenches.fibSequence(nthValue: 2))
//		print(swiftBenches.fibSequence(nthValue: 3))
//		print(swiftBenches.fibSequence(nthValue: 4))
//		print(swiftBenches.fibSequence(nthValue: 5))
//		print(swiftBenches.fibSequence(nthValue: 6))
//		print(swiftBenches.fibSequence(nthValue: 7))
		var cache: [UInt64?] = []
		print(swiftBenches.fibSequenceWithCache(nthValue: 93, cache: &cache))
		print(swiftBenches.fibSequence(nthValue: 40))
	}

	@IBAction func objcFibPressed(_ sender: UIButton) {
		print(objcBenches.fibSequenceNthValue(93, withCache: nil))
		print(objcBenches.fibSequenceNthValue(40))
	}
}

