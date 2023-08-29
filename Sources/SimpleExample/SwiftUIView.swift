//
//  SwiftUIView.swift
//  
//
//  Created by Ambas Chobsanti on 29/8/2566 BE.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        SimpleExample(title: "Sample", items: [
            .init(title: "Sample 1", view: SampleContent1()),
            .init(title: "Sample 2", view: SampleContent1())
        ])
    }
}

struct SampleContent1: View {
    var body: some View {
        Text("Sample 1")
    }
}

#Preview {
    SwiftUIView()
}


public struct SimpleExampleView: View {
    
    public struct Item {
        let title: String
        let view: AnyView
        public init(title: String, view: some View) {
            self.title = title
            self.view = AnyView(view)
        }
    }
    
    let items: [Item]
    let title: String
    
    public init(title: String, items: [Item]) {
        self.title = title
        self.items = items
    }
    
    public var body: some View {
        NavigationView {
            List(items, id: \.title) { item in
                NavigationLink(destination: item.view, label: { Text(item.title) })
            }
            .navigationTitle(title)
        }
    }
}
