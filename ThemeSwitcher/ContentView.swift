//
//  ContentView.swift
//  ThemeSwitcher
//
//  Created by Srinivas Prayag Sahu on 19/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var changeTheme: Bool = false
    @AppStorage("USER_THEME") private var userTheme: Theme = .systemDefault
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change Theme") {
                        changeTheme.toggle()
                    }
                    .foregroundStyle(.primary)
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangeView(scheme: scheme)
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        })
    }
}

#Preview {
    ContentView()
}
