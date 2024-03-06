//
//  SearchResultTableViewCell.swift
//  Stock
//
//  Created by Konstantin Skrypak on 06.03.2024.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

	static let identifier = "SearchResultTableViewCell"
	
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
}
