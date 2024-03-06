//
//  EasyDebounce.swift
//  Stock
//
//  Created by Konstantin Skrypak on 07.03.2024.
//

import Foundation

class EasyDebounce {
	private  static var timers: [String:Timer] = [:]
	
	public static func debounce(_ tag: String, duration: Double = 0.3, block: @escaping () -> Void) {
		timers[tag]?.invalidate()
		
		timers[tag] = Timer.scheduledTimer(withTimeInterval: duration, repeats: false, block: { _ in
			timers.removeValue(forKey: tag)
			block()
		})
	}
}
