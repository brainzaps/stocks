//
//  PersistenceManager.swift
//  Stock
//
//  Created by Konstantin Skrypak on 06.03.2024.
//

import Foundation

final class PersistenceManager {
	static let shared = PersistenceManager()
	
	private let userDefaults: UserDefaults = .standard
	
	private struct Constants {}
	
	init () {}
	
	// MARK: - Public
	
	public var watchlist: [String] {
		return []
	}
	
	public func addToWatchlist() {}
	
	public func removeFromWatchlist() {}
	
	// MARK: - Private
	
	
	private var hasOnboarded: Bool {
		return false
	}
}
