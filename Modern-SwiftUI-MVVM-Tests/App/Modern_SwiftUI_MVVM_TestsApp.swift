//
//  Modern_SwiftUI_MVVM_TestsApp.swift
//  Modern-SwiftUI-MVVM-Tests
//
//  Created by Burhan Aras on 28.08.2021.
//

import SwiftUI

@main
struct Modern_SwiftUI_MVVM_TestsApp: App {
    var body: some Scene {
        WindowGroup {
           MarvelListView(viewModel: MarvelListViewModel(networkLayer: NetworkLayer()))
        }
    }
}
