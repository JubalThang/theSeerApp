//
//  HomeView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var firebaseRepo : FirebaseRespository
    var body: some View {
        Text("\(firebaseRepo.pastors.count)")
            .onAppear(perform: {
                firebaseRepo.fetchFirebase()
            })
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
