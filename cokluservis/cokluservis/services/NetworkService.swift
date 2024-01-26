//
//  NetworkService.swift
//  cokluservis
//
//  Created by Olgun ‏‏‎‏‏‎ on 26.01.2024.
//

import Foundation
protocol NetworkService {
    func download(_ resource : String) async throws -> [User] 
    var type : String{get}
}

