//
//  ViewController.swift
//  Stock
//
//  Created by Konstantin Skrypak on 05.03.2024.
//

import UIKit
import Combine

class WatchListViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor  = .systemBackground
		
		setUpSearchController()
		setUpTitleView()
	}
	
	private func setUpSearchController() {
		let resultVC = SearchResultsViewController()
		let searchVC = UISearchController(searchResultsController: resultVC)
		searchVC.searchResultsUpdater = self
		
		navigationItem.searchController = searchVC
	}
	
	private func setUpTitleView() {
		let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
		
		let label = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width - 20, height: titleView.height))
		label.text = "Stocks"
		label.font  = .systemFont(ofSize: 32, weight: .medium)
		
		titleView.addSubview(label)
		navigationItem.titleView = titleView
	}

}

extension WatchListViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		guard let query = searchController.searchBar.text,
					let resultVC = searchController.searchResultsController as? SearchResultsViewController,
					!query.trimmingCharacters(in: .whitespaces).isEmpty else { return }
		
	}
	
	
}

