//
//  MostRecentSermonView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MostRecentSermonView: View {
    let video : Video
    let height : CGFloat
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                //            Color(.systemBlue)
                //                .cornerRadius(10)
                //                .aspectRatio(1.78, contentMode: .fit) // 1.78 = 16:9
                //                .shadow(radius: 5)
                WebImage(url: URL(string: video.thumbnail))
                    .renderingMode(.original)
                    .resizable()
                    .indicator(Indicator.activity)
                    .aspectRatio(1.78, contentMode: .fit) // 1.78 = 16:9
                    .cornerRadius(10)
                    .background(Color.clear)
                //
                HStack {
                    Text("\(video.title)")
                        //                    Text("Title")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.black.opacity(0.3))
                .cornerRadius(radius: 10, corners: [.bottomLeft, .bottomRight])
            }
            
            Text("အသစ်ဆုံးနှုတ်ကပတ်")
                .foregroundColor(.white)
                .font(.caption)
                .padding(5)
                .padding(.vertical, 5)
                .background(Color(.systemRed).opacity(0.8))
                .cornerRadius(10)
                .padding(10)
        }
        .frame(height: height)
        .padding()
    }
}
//
//struct MostRecentSermonView_Previews: PreviewProvider {
//    static var previews: some View {
//        MostRecentSermonView()
//    }
//}
