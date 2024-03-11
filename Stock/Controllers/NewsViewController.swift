//
//  NewsStoriesNewsViewController.swift
//  Stock
//
//  Created by Konstantin Skrypak on 06.03.2024.
//

import UIKit

class NewsViewController: UIViewController {
	
	public let tableView: UITableView = {
		let table = UITableView()
		
		return table
	}()
	
	private var type: Type?
	
	enum `Type` {
		case topStories,
		case compan(symbol: String)
		
		var title: String {
			switch self {
			case .topStories:
				return "Top Storeis"
			case .compan(let symbol):
				return symbol.uppercased()
			}
		}
	}
	
	init(type: Type) {
		self.type = type
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setUpTable()
		fetchNews()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableView.frame = view.bounds
	}
	
	private func setUpTable() {}
	
	private func fetchNews() {}
	
	private func open(url: URL) {}
}
