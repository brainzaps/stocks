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
		table.register(NewsHeaderView.self, forHeaderFooterViewReuseIdentifier: NewsHeaderView.identifier)
		table.register(NewsStoryTableViewCell.self, forCellReuseIdentifier: NewsStoryTableViewCell.identifier)
		table.backgroundColor = .clear
		return table
	}()
	
	private var type: Type
	
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
	
	private var stories = [NewsStory]()
	
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
		guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsStoryTableViewCell.identifier, for: indexPath) as? NewsStoryTableViewCell else {
			fatalError()
		}
		
		cell.configure(with: .init(stories[indexPath.row]))
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsHeaderView.identifier  ) as? NewsHeaderView else {
			return nil
		}
		
		header.configure(with: .init(title: self.type.title , shouldShowAddButton: false))
		return header
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return NewsStoryTableViewCell.preferredHeight
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return NewsHeaderView.preferredHeight
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
