//
//  NewsHeaderView.swift
//  Stock
//
//  Created by Konstantin Skrypak on 12.03.2024.
//

import UIKit

protocol NewsHeaderViewDelegate: AnyObject {
	func newsHeaderViewDidTapAddButton(_ headerView: NewsHeaderView)
}

class NewsHeaderView: UITableViewHeaderFooterView {
	
	static let identifier = "NewsHeaderView"
	static let preferredHeight: CGFloat = 70
	
	weak var delegate: NewsHeaderViewDelegate?
	
	struct ViewModel {
		let title: String
		let shouldShowAddButton: Bool
	}
	
	private let label: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 32)
		return label
	}()
	
	private let button: UIButton = {
		let button = UIButton()
		button.setTitle("+ Watchlist", for: .normal)
		button.backgroundColor = .systemBlue
		button.setTitleColor(.white, for: .normal)
		button.layer.cornerRadius = 6
		button.layer.masksToBounds = true
		return button
	}()
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(label)
		contentView.addSubview(button)
		button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
	}
	
	@objc private func didTapButton() {
		delegate?.newsHeaderViewDidTapAddButton(self)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		label.frame = CGRect(x: 14, y: 0, width: contentView.width - 28, height: contentView.height)
		
		button.sizeToFit()
		button.frame = CGRect(x: contentView.width - button.width - 14, y: (contentView.height - button.height) / 2, width: button.width + 8, height: button.height)
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	public func configure(with viewModel: ViewModel) {
		label.text = viewModel.title
		button.isHidden = !viewModel.shouldShowAddButton
	}
}
