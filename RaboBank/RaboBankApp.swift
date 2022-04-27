//
//  RaboBankApp.swift
//  RaboBank
//
//  Created by m_944879 on 26/4/22.
//

import SwiftUI

@main
struct RaboBankApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
