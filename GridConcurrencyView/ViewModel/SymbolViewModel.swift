//
//  SymbolViewModel.swift
//  GridConcurrencyView
//
//  Created by MACBOOK PRO on 22/04/24.
//

import Foundation

class SymbolViewModel: ObservableObject {
    @Published var symbols: [SymbolModel] = SymbolModel.dummyData

    // synchronous
    func downloadImageAndBlockUI() {
        let urlString = "https://res.cloudinary.com/dxbtolxhj/image/upload/v1713407597/Screenshot_2024-04-18_at_09.31.11_im06jo.png?uuid=\(UUID().uuidString)"
        
        guard let url = URL(string: urlString) else { return }
        
        // DispatchQueue.global().sync (berjalan di main thread, akan block proses selanjutnya sampai proses selesai)
        // DispatchQueue.main().async (berjalan dibackground, setelah selesai akan dikembalikan ke main thread, tidak blok proses selanjutnya)
        
        // Simulasi download file
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 2)
            let output = try? Data(contentsOf: url)
            
            print(output!)
            print(url)
        }
    }
    
    // asynchronous
    func downloadImageWithoutBlockUI() async {
        let urlString = "https://res.cloudinary.com/dxbtolxhj/image/upload/v1713407597/Screenshot_2024-04-18_at_09.31.11_im06jo.png?uuid=\(UUID().uuidString)"
        
        guard let url = URL(string: urlString) else { return }
        
        // DispatchQueue.global().sync (berjalan di main thread, akan block proses selanjutnya sampai proses selesai)
        // DispatchQueue.main().async (berjalan dibackground, setelah selesai akan dikembalikan ke main thread, tidak blok proses selanjutnya)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
             print(data)
             print(url)
            
            // Simulasi download file
            DispatchQueue.global().async {
                Thread.sleep(forTimeInterval: 2)
                let output = try? Data(contentsOf: url)
                
                print(output!)
                print(url)
            }
        } catch {
            print("Error downloading image: \(error)")
        }
    }
}
