//
//  ButtonView.swift
//  Async
//
//  Created by Niclas Jeppsson on 30/03/2022.
//

import SwiftUI

struct ButtonView: View {

    var viewModel: ViewModel

    var body: some View {
        Button {
            viewModel.getBreweries()
        } label: {
            Text("Get Brews")
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .trailing))
        .foregroundColor(.white)
        .cornerRadius(20)
        .padding()
        .shadow(color: .pink, radius: 10, x: 0, y: 5)
    }
}
