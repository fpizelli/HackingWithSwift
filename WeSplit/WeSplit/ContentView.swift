//
//  ContentView.swift
//  WeSplit
//
//  Created by Felipe Pizelli on 20/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var valorConversao = 0.0
    @State private var medidaOrigem = "Metros"
    @State private var medidaDestino = "Metros"
    
    let medidasConversao = ["Kilometros", "Metros", "Centímetro"]
    
    var conversaoDeMedidas: Double {
        
        let unidadeOrigem: UnitLength
        switch medidaOrigem {
        case "Kilometros":
            unidadeOrigem = .kilometers
        case "Centímetro":
            unidadeOrigem = .centimeters
        default:
            unidadeOrigem = .meters
        }
        
        let unidadeDestino: UnitLength
        switch medidaDestino {
        case "Kilometros":
            unidadeDestino = .kilometers
        case "Centímetro":
            unidadeDestino = .centimeters
        default:
            unidadeDestino = .meters
        }
        
        let medida = Measurement(value: valorConversao, unit: unidadeOrigem)
        let medidaConvertida = medida.converted(to: unidadeDestino)
        
        return medidaConvertida.value
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("O que você deseja converter?") {
                    TextField("Valor", value: $valorConversao, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("De qual medida você deseja converter?") {
                    Picker("Medida de origem", selection: $medidaOrigem) {
                        ForEach(medidasConversao, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Para qual medida você deseja converter?") {
                    Picker("Medida de Destino", selection: $medidaDestino) {
                        ForEach(medidasConversao, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Medida convertida") {
                    Text(conversaoDeMedidas.formatted())
                }
            }
            .navigationTitle("Conversor de medidas")
        }
    }
}

#Preview {
    ContentView()
}
