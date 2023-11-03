//
//  CardService.swift
//  SimonsMemory
//
//  Created by Bruno Thuma on 02/10/23.
//

import Foundation

enum CardServiceError: Error {
    case badImageName
}

protocol CardService {
    func fetchCards(numberOfUniqueCards number: Int,
                    completion:  (Result<[Card], CardServiceError>) -> Void)
}
