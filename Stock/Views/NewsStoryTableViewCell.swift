//
//  NewsStoryTableViewCell.swift
//  Stock
//
//  Created by Konstantin Skrypak on 14.03.2024.
//

import UIKit
import SDWebImage

class NewsStoryTableViewCell: UITableViewCell {
	
	static let identifier = "NewsStoryTableViewCell"
	
	static let preferredHeight: CGFloat = 140
	
	struct ViewModel {
		let source: String
		let headline: String
		let dateString: String
		let imageUrl: URL?
		
		init(_ model: NewsStory) {
			source = model.source
			headline = model.headline
			dateString = String.string(from: model.datetime)
			imageUrl = URL(string: model.image)
		}
	}
	
	private let sourceLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 14, weight: .medium)
		return label
	}()
	
	private let headlineLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 24, weight: .regular)
		label.numberOfLines = 0
		return label
	}()
	
	
	private let dateLabel: UILabel = {
		let label = UILabel()
		label.textColor = .secondaryLabel
		label.font = .systemFont(ofSize: 14, weight: .light)
		return label
	}()
	
	private let storyImageView: UIImageView = {
		let image = UIImageView()
		image.clipsToBounds = true
		image.contentMode = .scaleAspectFill
		image.layer.cornerRadius = 6
		image.layer.masksToBounds = true
		image.backgroundColor = .white
		return image
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.backgroundColor = nil
		backgroundColor  = nil
		addSubview(sourceLabel)
		addSubview(headlineLabel)
		addSubview(dateLabel)
		addSubview(storyImageView)
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let imageSize: CGFloat = contentView.height - 6
		storyImageView.frame = CGRect(x: contentView.width - imageSize - 10, y: 3, width: imageSize, height: imageSize)
		
		let availableWidth = contentView.width - separatorInset.left - imageSize - 15
		dateLabel.frame = CGRect(x: separatorInset.left, y: contentView.height - 40, width: availableWidth, height: 40)
		
		sourceLabel.sizeToFit()
		sourceLabel.frame = CGRect(x: separatorInset.left, y: 4, width: availableWidth, height: sourceLabel.height)
		
		headlineLabel.frame = CGRect(x: separatorInset.left, y: sourceLabel.bottom + 5, width: availableWidth, height: contentView.height - sourceLabel.height - dateLabel.height - 10)

	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		sourceLabel.text = nil
		headlineLabel.text = nil
		dateLabel.text = nil
		storyImageView.image = nil
	}
	
	public func configure(with viewModel: ViewModel) {
		headlineLabel.text = viewModel.headline
		sourceLabel.text = viewModel.source
		dateLabel.text = viewModel.dateString
		storyImageView.sd_setImage(with: viewModel.imageUrl)
	}
}
