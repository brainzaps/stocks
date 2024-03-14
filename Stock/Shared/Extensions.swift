//
//  Extensions.swift
//  Stock
//
//  Created by Konstantin Skrypak on 06.03.2024.
//

import Foundation
import UIKit

extension String {
	static func string(from timeInterval: TimeInterval) -> String {
		let date = Date(timeIntervalSince1970: timeInterval)
		return DateFormatter.prettyDateFormatter.string(from: date)
	}
}

extension DateFormatter {
	static let prettyDateFormatter: DateFormatter  = {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		return formatter
	}()
	
	static let newsDateFormatter: DateFormatter  = {
		let formatter = DateFormatter()
		formatter.dateFormat = "YYYY-MM-dd"
		return formatter
	}()
}

extension UIView {
	var width: CGFloat {
		frame.size.width
	}
	
	var height: CGFloat {
		frame.size.height
	}
	
	var left: CGFloat {
		frame.origin.x
	}
	
	var right: CGFloat {
		left + width
	}
	
	var top: CGFloat {
		frame.origin.y
	}
	
	var bottom: CGFloat {
		top + height
	}
}
