//
//  ContentView.swift
//  GridDemo
//
//  Created by Joynal Abedin on 17/3/23.
//

import SwiftUI

struct ContentView: View {
    
    private var colors: [Color] = [.blue, .yellow, .green]
    private var gridItems = [GridItem(.fixed(100))]
    private var gridVItems = [GridItem(.adaptive(minimum: 100, maximum: .infinity))]

    
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                Text("Horizontal Task").multilineTextAlignment(.leading).padding(); Spacer()
            }
                
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridItems, spacing: 25) {
                    ForEach(0...80, id: \.self) { index in
                        CellContent(index: index, color: colors[index % colors.count])
                    }
                }
                .padding(5)
            }
            .background(Color.cyan)
            .scrollIndicators(.hidden)
            .navigationTitle("Task")
            
            HStack {
                Text("Vertical Task").multilineTextAlignment(.leading).padding(); Spacer()
            }
                
            ScrollView(.vertical) {
                LazyVGrid(columns: gridVItems, spacing: 5) {
                    ForEach(0...20, id: \.self) { index in
                        CellVContent(index: index, color: colors[index % colors.count])
                    }
                }
                .padding(5)
            }
            .background(Color.cyan)
            .scrollIndicators(.hidden)
            .navigationTitle("Task")
        }
        .background(Color.red)
        
    }
}

struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        VStack {
            Text("\(index)")
                .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                .background(color)
                .cornerRadius(8)
                .font(.system(.largeTitle))
            Text("Hello")
        }
    }
}

struct CellVContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
            Text("\(index)")
                .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                .background(color)
                .cornerRadius(8)
                .font(.system(.largeTitle))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
