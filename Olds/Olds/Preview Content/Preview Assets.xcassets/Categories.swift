//
//  Categories.swift
//  Olds
//
//  Created by Gupta, Antara on 27/08/24.
//
import SwiftUI

struct FlowLayout: View {
    var items: [String]
    var spacing: CGFloat = 10
    var alignment: HorizontalAlignment = .leading
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry.size)
        }
    }
    
    private func generateContent(in size: CGSize) -> some View {
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        return ZStack(alignment: Alignment(horizontal: alignment, vertical: .top)) {
            ForEach(items.indices, id: \.self) { index in
                self.item(for: index)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > size.width) {
                            width = 0
                            height -= d.height + self.spacing
                        }
                        let result = width
                        if index == self.items.count - 1 {
                            width = 0
                        } else {
                            width -= d.width + self.spacing
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if index == self.items.count - 1 {
                            height = 0
                        }
                        return result
                    })
            }
        }
    }
    
    private func item(for index: Int) -> some View {
        Button(action: {
            // Define what happens when the button is pressed
            print("\(items[index]) button pressed")
        }) {
            Text(items[index])
                .padding()
                .background(Color.indigo)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

struct Categories: View {
    let categories = ["Technology", "Health", "Finance", "Education", "Travel", "Food", "Sports", "Entertainment", "Fashion", "Science"]
    
    var body: some View {
        VStack {
            // App Logo
            Image("logo") // Replace "app-logo" with your actual image name
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.top, 40)
            
            // Flow Layout
            ScrollView {
                FlowLayout(items: categories)
                    .padding(8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        Button(action: {
                      // Define what happens when the button is pressed
                  }) {
                      Text("Next")
                          .padding()
                          .background(Color.indigo)
                          .foregroundColor(.white)
                          .cornerRadius(8)
                  }
                  .padding(.bottom, 10)
    }
    
    
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}

