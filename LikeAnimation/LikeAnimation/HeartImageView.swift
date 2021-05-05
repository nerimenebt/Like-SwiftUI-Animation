//
//  HeartImageView.swift
//  LikeAnimation
//
//  Created by Nerimene on 4/5/2021.
//

import SwiftUI

struct HeartImageView: View {
    
    var body: some View {
        Image(systemName: "suit.heart.fill")
            .font(.system(size: 160, weight: .medium, design: .monospaced))
    }
}

struct HeartImageView_Previews: PreviewProvider {
    static var previews: some View {
        HeartImageView()
    }
}
