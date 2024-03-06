//
//  Extensions.swift
//  Stock
//
//  Created by Konstantin Skrypak on 06.03.2024.
//

import Foundation
import UIKit

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
