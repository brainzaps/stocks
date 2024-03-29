//
//  SearchResultsViewController.swift
//  Stock
//
//  Created by Konstantin Skrypak on 06.03.2024.
//

import UIKit

protocol SearchResultsViewControllerDelegate: AnyObject {
	func searchResultsViewControllerDidSelect(searchResult: SearchResult)
}

class SearchResultsViewController: UIViewController {
	
	weak var delegate: SearchResultsViewControllerDelegate?
	
	private var results: [SearchResult] = []
	
	private let tableView: UITableView = {
		let table = UITableView()
		table.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
		table.isHidden = true
		return table
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		setUpTable()
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
	
	public func update(with results: [SearchResult]) {
		self.results = results
		tableView.isHidden = self.results.isEmpty
		tableView.reloadData()
	}
	
}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.results.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath)
		
		let model = self.results[indexPath.row]
		
		cell.textLabel?.text = model.displaySymbol
		cell.detailTextLabel?.text = model.description
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let model = self.results[indexPath.row]
		delegate?.searchResultsViewControllerDidSelect(searchResult: model)
	}
	
}
