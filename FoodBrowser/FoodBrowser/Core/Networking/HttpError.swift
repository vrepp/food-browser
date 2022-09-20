//
//  HttpError.swift
//  FoodBrowser
//
//  Created by Valentin Rep on 20.09.2022..
//

import Foundation

enum HttpError: LocalizedError {
    case invalidURL(String)
    case decode(Error)
    case noResponse
    case badRequest(Data)
    case unauthorized
    case unexpectedStatusCode(Int)
    case unknown

    var errorDescription: String? {
        switch self {
            case .invalidURL(let url):
                return "Invalid URL: \(url)"

            case .decode(let error):
                return "Decode error: \(error.localizedDescription)"

            case .noResponse:
                return "No response from server"

            case .badRequest(let data):
                return String(decoding: data, as: UTF8.self)

            case .unauthorized:
                return "Session expired"

            case .unexpectedStatusCode(let statusCode):
                return "Unexpected status code: \(statusCode)"

            default:
                return "Unknown error"
        }
    }
}
