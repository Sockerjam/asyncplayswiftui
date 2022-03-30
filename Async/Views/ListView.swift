//
//  ListView.swift
//  Async
//
//  Created by Niclas Jeppsson on 30/03/2022.
//

import SwiftUI

struct ListView: View {

    var viewModel: ViewModel

    var body: some View {
        List(viewModel.breweries, id: \.self) { brewery in
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(brewery.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(brewery.city)
                        .font(.body)
                        .fontWeight(.light)
                }
                Spacer()
                Text(brewery.state)
                    .font(.body)
                    .fontWeight(.regular)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ViewModel())
    }
}
