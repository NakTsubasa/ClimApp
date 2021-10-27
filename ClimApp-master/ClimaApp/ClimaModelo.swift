//
//  ClimaModelo.swift
//  ClimaApp
//
//  Created by Mac7 on 30/11/20.
//  Copyright © 2020 itmorelia. All rights reserved.
//

import Foundation

struct ClimaModelo {
    let condicionID: Int
    let nombreCiudad: String
    let temperaturaCelcius: Double
    let descripcionClima: String
    
    var obtenerCondicionClima: String {
        switch condicionID {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle"
        default:
            return "cloud"
        }
        
        
    }
}
