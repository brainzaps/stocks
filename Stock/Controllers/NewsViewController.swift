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
		table.backgroundColor = .clear
		return table
	}()
	
	private var type: Type?
	
	enum `Type` {
		case topStories
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
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError()
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
	
	private func setUpTable() {
		view.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	private func fetchNews() {}
	
	private func open(url: URL) {}
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	 return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return nil
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 140
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 70
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
