//
//  GridItem.swift
//  WATimer
//
//  Created by Cédric Bahirwe on 07/06/2021.
//

import SwiftUI

struct GridItem: View {
    var color: Color = .orange
    let title: String
    let subtitle: String
    let image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .padding(5)
                .frame(width: 20, height: 20)
                .background(color.opacity(0.1))
                .cornerRadius(5)
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontWeight(.medium)
                Text(subtitle)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(color)
            }
        }
        .padding(10)
        .frame(height: 65)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
    }
}
