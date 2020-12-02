//
//  climaManager.swift
//  ClimaApp
//
//  Created by Mac7 on 24/11/20.
//  Copyright © 2020 itmorelia. All rights reserved.
//

import Foundation

//Implementar el metodo acualizar el clima
protocol ClimaManagerDelegate {
    func actualizarElClima(clima: ClimaModelo)
}

struct ClimaManager {
    
    var delegado: ClimaManagerDelegate?
    
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?appid=appbd93848b59316f6b547188ed75b99d4f&units=metric&lang=es"
    
    func fetchClima(){
        
        func fetchClima(nombreCiudad: String) {
            let urlString = "\(climaURL)&q=\(nombreCiudad)"
            print(urlString)
            realizarSolicitud(urlString: urlString)
        }
        
        func realizarSolicitud(urlString: String) {
            // 1.- creal la url
            if let url = URL(string: urlString){
                //2.-Crear el obj URLSession
                let session = URLSession(configuration: .default)
                
                //3.- asignar una tarea a la sesion
                let tarea = session.data.dataTask(witch: url, completionHandler: handle(data:respuesta:error:)) in
                
                if error != nil {
                    print(error)
                    return
                }
                
                if let datosSeguros = data {
                    //Decodificar elobj JSON de la API
                    //self.parseJSON(climaData: datosSeguros)
                    if let clima = parseJSON(climaData: datosSeguros){
                        delegate?.actualizarClima(clima: clima)
                    }
                }
            }
            //4.-Empezar la tarea
            tarea.resume()
            }
            
        }
        
        //Metodo que evita que se congela la app mientras responde la api
        func handle(data: Data?, respuesta: URLResponse?, error: Error?){
            if error != nil {
                print(error!)
                return
            }
            
            if let datosSeguros = data {
                //necesitamos convertir esa data a tipo string
                print (data)
                let dataString = String(data: datosSeguros, encoding: .utf8)
                print(dataString!)
            }
        }
    
    func parseJSON(climaData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let dataDecodificada = try decoder.decode(ClimaData.self, from: ClimaData)
            print(dataDecodificada.name)
            print(dataDecodificada.cod)
            print(dataDecodificada.main.temp)
            print(dataDecodificada.main.humidity)
            print(dataDecodificada.weather[0].description)
            print("Latitud: \(dataDecodificada.coord.lat), longitud: \(dataDecodificada.coord.lon)")
            
        } catch {
            print(error)
        }
    }
}
