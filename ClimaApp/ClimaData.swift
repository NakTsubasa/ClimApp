//
//  ClimaData.swift
//  ClimaApp
//
//  Created by Mac7 on 30/11/20.
//  Copyright © 2020 itmorelia. All rights reserved.
//

import Foundation

struct ClimaData {
    let name: String
    let cod: Int
    let main: Main
    let weather: [Weather]
    let coord: Coord
}

struct Main {
    let temp: Double
    let humity: Int
}

struct Weather: Decodable {
    let description: String
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}
