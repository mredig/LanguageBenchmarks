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

	let formatter: NumberFormatter = {
		let format = NumberFormatter()
		format.numberStyle = .decimal
		format.maximumFractionDigits = 10
		return format
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		textView.font = UIFont.monospacedDigitSystemFont(ofSize: 14, weight: .medium)
		// Do any additional setup after loading the view.
	}

	func benchmarkSwift(titled title: String, iterations: Int, benchmark: (Int) -> Void) {
		let duration = swiftBenches.benchmark(iterations: iterations, benchmark: benchmark)
		let humanDuration = formatter.string(from: duration as NSNumber) ?? "\(duration)"
		textView.text = textView.text + "\n\(title) (Swift): \(humanDuration) seconds."
	}

	func benchmarkObjectiveC(titled title: String, iterations: Int, benchmark: @escaping (Int) -> Void) {
		let duration = objcBenches.benchmark(withIterations: iterations, benchmark: benchmark)
		let humanDuration = formatter.string(from: duration as NSNumber) ?? "\(duration)"
		textView.text = textView.text + "\n\(title) (ObjC): \(humanDuration) seconds."
	}

	func benchmarkC(titled title: String, iterations: Int, benchmark: @escaping (Int) -> Void) {
		let duration = objcBenches.benchmark(withIterations: iterations, benchmark: benchmark)
		let humanDuration = formatter.string(from: duration as NSNumber) ?? "\(duration)"
		textView.text = textView.text + "\n\(title) (C): \(humanDuration) seconds."
	}

	@IBAction func swiftFibPressed(_ sender: UIButton) {
		benchmarkSwift(titled: "Fib No Cache", iterations: 1) { _ in
			let _ = swiftBenches.fibSequence(nthValue: 40)
		}
	}

	@IBAction func swiftFibCachePressed(_ sender: UIButton) {
		var storage = [UInt64].init(repeating: 0, count: 1000)
		benchmarkSwift(titled: "Fib With Cache", iterations: 1000) { iteration in
			let value = swiftBenches.fibSequenceWithCache(nthValue: 93)
			storage[iteration] = value
		}
	}

	@IBAction func objcFibPressed(_ sender: UIButton) {
		benchmarkObjectiveC(titled: "Fib No Cache", iterations: 1) { _ in
			let _ = self.objcBenches.fibSequenceNthValue(40)
		}
	}

	@IBAction func objcFibCachePressed(_ sender: UIButton) {
		var storage = [UInt64].init(repeating: 0, count: 1000)
		benchmarkObjectiveC(titled: "Fib With Cache", iterations: 1000) { iteration in
			let value = self.objcBenches.fibSequenceNthValue(93, withCache: nil)
			storage[iteration] = value
		}
	}

	@IBAction func cFibPressed(_ sender: UIButton) {
		benchmarkC(titled: "Fib No Cache", iterations: 1) { iteration in
			let _ = fibSequenceNthValue(40)
		}
	}

	@IBAction func cFibCachePressed(_ sender: UIButton) {
		var storage = [UInt64].init(repeating: 0, count: 1000)
		benchmarkC(titled: "Fib With Cache", iterations: 1000) { iteration in
			let value = fibSequenceNthValueCache(93)
			storage[iteration] = value
		}
	}
}

