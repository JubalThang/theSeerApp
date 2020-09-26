//
//  HomeView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var firebaseRepo : FirebaseRespository
    @State var selectedPastor = pastorExample
    
    @State var isPastorSelected = false
    
    var body: some View {
        VStack {
            if !firebaseRepo.pastors.isEmpty {
                
                HomeViewController(isSelectionPastor: $isPastorSelected, selectedPastor: $selectedPastor, pastors: firebaseRepo.pastors) { (pastor) in
                    self.selectedPastor = pastor
                }
                
            }
            
            NavigationLink(
                destination: Text("Destination"),
                isActive: self.$isPastorSelected,
                label: {
                    EmptyView()
                })
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
