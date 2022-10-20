//
//  ContentView.swift
//  AVPlayerDemo
//
//  Created by Hongjian Lin on 10/19/22.
//

import SwiftUI

struct ContentView: View {

    var viewModel: ContenViewModel = ContenViewModel()

    var body: some View {
        if let playViewModel = viewModel.playerViewModel {
            PlayerView(viewModel: playViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
