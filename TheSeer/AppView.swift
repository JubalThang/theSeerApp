//
//  ContentView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/25/20.
//

import SwiftUI

struct AppView: View {
    var firebaseRepo = FirebaseRespository()
    var body: some View {
        TabView {
            NavigationView {
                if #available(iOS 14.0, *){
                HomeView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Image("navlogo")
                        }
                    }
                } else {
                    HomeView()
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarItems(trailing: Image("navlogo"))
                }
                
            }
            .environmentObject(firebaseRepo)
            .tabItem {
                VStack {
                    Image("home").renderingMode(.template)
                    Text("HOME")
                }
            }
            NavigationView {
                if #available(iOS 14.0, *) {
                SermonsView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Image("navlogo")
                        }
                    }
                } else {
                    SermonsView()
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarItems(trailing: Image("navlogo"))
                }
            }
            .tabItem {
                VStack{
                    Image("sermons").renderingMode(.template)
                    Text("SERMONS")
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
