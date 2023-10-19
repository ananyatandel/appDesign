//
//  ContentView.swift
//  appDesign
//
//  Created by Ananya Tandel on 10/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption = 0

    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    Picker("", selection: $selectedOption) {
                        Text("Stay Local").tag(0)
                        Text("Go Global").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    if selectedOption == 0 {
                        ScrollView {
                            CardView()
                            CardView()
                            CardView()
                        }
                    }
                }
             .background(Color.gray)
                .navigationBarItems(
                    leading: FilterButton(),
                    trailing: ProfileButton()
                )
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)

            Text("Plus Icon View")
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Add")
                }
                .tag(1)

            Text("Profile Icon View")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .background(Color.white)
    }
}

struct FilterButton: View {
    var body: some View {
        Button(action: {
            // functionality
        }) {
            Image(systemName: "line.horizontal.3.decrease.circle")
                .font(.title)
        }
    }
}

struct ProfileButton: View {
    var body: some View {
        Button(action: {
            // button action
        }) {
            Image(systemName: "person.circle")
                .font(.title)
        }
    }
}

struct CardView: View {
    @State private var isLiked = false
    var body: some View {
        VStack {
            Image("crossaints-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)

            Text("To make delicious croissants, start by combining 1 1/2 cups of warm milk with 2 1/4 teaspoons of active dry yeast and a tablespoon of sugar. Let it sit for 5 minutes, then add 4 cups of all-purpose flour, 1/4 cup of sugar, 1 teaspoon of salt, and 1 cup of softened butter. Knead the dough, refrigerate it for an hour, then roll it out, cut into triangles, and roll each one into a croissant shape. Bake at 375°F (190°C) for about 15-20 minutes until they turn golden brown. Enjoy your homemade croissants!")
                .font(.body)
                .padding()

            HStack {
                Button(action: {
                    isLiked.toggle() // Toggle the like status when the heart button is tapped
                    saveLikeStatus() // Save the like status to UserDefaults
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                }

                Spacer()

                Button(action: {
                    // pin button action (none for now)
                }) {
                    Image(systemName: "pin")
                }

                Spacer()

                Button(action: {
                    // comment button action (none for now)
                }) {
                    Image(systemName: "message")
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding()
        .onAppear(perform: loadLikeStatus) // Load the like status when the view appears
    }

    private func saveLikeStatus() {
        // Save like status to UserDefaults
        UserDefaults.standard.set(isLiked, forKey: "isLiked")
    }

    private func loadLikeStatus() {
        // Load like status from UserDefaults
        if let isLiked = UserDefaults.standard.object(forKey: "isLiked") as? Bool {
            self.isLiked = isLiked
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
