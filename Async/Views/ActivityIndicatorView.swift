//
//  ActivityIndicatorView.swift
//  Async
//
//  Created by Niclas Jeppsson on 30/03/2022.
//

import SwiftUI

struct ActivityIndicatorView: View {
    var body: some View {
        ProgressView("Loading Breweries")
            .frame(maxWidth: .infinity)
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
