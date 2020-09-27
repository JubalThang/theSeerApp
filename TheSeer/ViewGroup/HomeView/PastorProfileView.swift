//
//  PastorProfileView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI

struct PastorProfileView: View {
    var selectedPastor : Pastor
    
    var body: some View {
        ScrollView {
            Image("profile_frame")
                .modifier(FrameModifier(imgeUrl: selectedPastor.img_url))
                .padding(.top, 10)
            Text(selectedPastor.name)
                .font(.headline)
                .padding()
            Text(selectedPastor.bio).lineSpacing(10)
                .padding()
        }
    }
}

struct PastorProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PastorProfileView(selectedPastor: pastorExample)
    }
}
