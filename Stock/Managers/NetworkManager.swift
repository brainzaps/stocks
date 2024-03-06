//
//  HttpManager.swift
//  Stock
//
//  Created by Konstantin Skrypak on 06.03.2024.
//

import Foundation

final class NetworkManager {
	static let shared = NetworkManager()
	
	private struct Constants {
		static let apiKey = "cnkeak1r01qiclq84cagcnkeak1r01qiclq84cb0"
		static let baseUrl = "https://finnhub.io/api/v1/"
	}
	
	private init() {
		
	}
	
	
	// MARK: - Public
	
	public func search(query: String) async -> Result<SearchResponse, Error> {
		guard let safeQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
			return .failure(NetworkError.badQuery)
		}
		
		let url = url(for: .search, queryParams: ["q": safeQuery])
		
		let result = await request(url: url, expecting: SearchResponse.self)
		
		return result
	}
	
	// MARK: - Private
	
	
	private enum Endpoint: String {
		case search
	}
	
	fileprivate enum NetworkError: Error {
		case fetching
		case search
		case badUrl
		case badQuery
	}
	
	private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
		var urlString = Constants.baseUrl + endpoint.rawValue
		
		var queryItems = [URLQueryItem]()
		
		for (name, value) in queryParams {
			queryItems.append(.init(name: name, value: value))
		}
		
		queryItems.append(.init(name: "token", value: Constants.apiKey))
		
		let queryString = queryItems.map { "\($0.name)=\($0.value ?? "")" }.joined(separator: "&")
		
		urlString += "?\(queryString)"
		
		return URL(string: urlString)
	}
	
	private func request<T: Codable>(url: URL?, expecting: T.Type) async -> Result<T, Error> {
		
		guard let url else { return .failure(NetworkError.badUrl) }
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			
			let result = try JSONDecoder().decode(expecting, from: data)
			
			return .success(result)
		} catch {
			return .failure(NetworkError.fetching)
		}
	}
}

extension NetworkManager.NetworkError: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case .badUrl:
			return String(localized: "Invalid URL")
		case .fetching:
			return String(localized: "Error occured while data fetching")
		case .search:
			return String(localized: "Error occured while searching")
		case .badQuery:
			return String(localized: "Bad query string")
		}
	}
}
