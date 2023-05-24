//
//  TestViewController.swift
//  NativeAvatar
//
//  Created by Yernar Masujima on 24.05.2023.
//

import UIKit

final class TestViewController: UIViewController {
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.delegate = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		return tableView
	}()
	
	private lazy var tableHeaderView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		
		return view
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
		label.text = "Avatar"
		label.setContentHuggingPriority(.defaultLow, for: .horizontal)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	private lazy var imageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
		imageView.layer.masksToBounds = true
		imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
		imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
		
		return imageView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		
		configureTableView()
		configureTableHeaderView()
	}
	
	private func configureTableView() {
		tableView.tableHeaderView = tableHeaderView
		
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	private func configureTableHeaderView() {
		tableHeaderView.addSubview(titleLabel)
		tableHeaderView.addSubview(imageView)

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: tableHeaderView.topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			titleLabel.bottomAnchor.constraint(equalTo: tableHeaderView.bottomAnchor),
			
			imageView.centerXAnchor.constraint(equalTo: tableHeaderView.centerXAnchor),
			imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
		])
	}
}

extension TestViewController: UITableViewDelegate {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let titlePoint = tableView.convert(CGPoint(x: imageView.bounds.minX, y: imageView.bounds.maxY), from: imageView)
		title = scrollView.contentOffset.y > titlePoint.y ? "Avatar" : nil
	}
}
