//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/28/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("Kellyslater")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            }
}

#Preview {
    CircularProfileImageView()
}
