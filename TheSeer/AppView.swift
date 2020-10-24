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
        if #available(iOS 14.0, *) {
            TabView {
                NavigationView {
                    HomeView()
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Image("navlogo")
                            }
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
                    SermonsView()
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Image("navlogo")
                            }
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
        } else {
            TabView {
                NavigationView {
                    
                    HomeView()
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarItems(trailing: Image("navlogo"))
                    
                }
                .environmentObject(firebaseRepo)
                .tabItem {
                    VStack {
                        Image("home").renderingMode(.template)
                        Text("HOME")
                    }
                }
                NavigationView {
                    
                    SermonsView()
                        .navigationBarTitle("", displayMode: .inline)
                    
                }
                .tabItem {
                    VStack{
                        Image("sermons").renderingMode(.template)
                        Text("SERMONS")
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
