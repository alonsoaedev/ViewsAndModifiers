//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alonso Acosta Enriquez on 02/08/24.
//

import SwiftUI

struct ProminentTitle: ViewModifier {
    let title: String
    
    func body(content: Content) -> some View {
        Text(title)
            .font(.largeTitle)
            .foregroundStyle(.blue)
            .padding()
        content
    }
}

extension View {
    func prominentTitle(_ text: String) -> some View {
        modifier(ProminentTitle(title: text))
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
        .prominentTitle("Project 3")
    }
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

#Preview {
    ContentView()
}
