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
		static let apiKey = ""
		static let sandboxApiKey = ""
		static let baseUrl = ""
	}
	
	private init() {
		
	}
	
	
	// MARK: - Public
	
	// MARK: - Private
	
	
	private enum Endpoint: String {
		case search
	}
	
	private enum NetworkError: Error {
		case fetching
		case badUrl
	}
	
	private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
		return nil
	}
	
	private func request<T: Codable>(url: URL?, expecting: T.Type) async -> Result<T, Error> {
		
		guard let url else { return .failure(NetworkError.badUrl) }
		
		do {
			let (data, response) = try await URLSession.shared.data(from: url)
			
			let result = try JSONDecoder().decode(expecting, from: data)
			
			return .success(result)
		} catch {
			return .failure(NetworkError.fetching)
		}
	}
}
