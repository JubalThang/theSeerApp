//
//  HomeCollectionView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI
struct HomeViewController : UIViewControllerRepresentable {
    
    @Binding var pastors : [Pastor]
    @Binding var isSelectionPastor : Bool
    
    var onCommit : (Pastor) -> Void
    
    func getIndex(pastor: Pastor) {
        onCommit(pastor)
    }
    
    class Coordinator : NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        var pastors = [Pastor]()
        
        let parent : HomeViewController
        
        static let homeViewCell_id = "homeCollectionCell_id"
        static let homeViewHeader_id = "homeViewHeader_id"
        
        init(_ parent : HomeViewController) {
            self.parent = parent
            self.pastors = parent.pastors
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3)
        }
        
        // Deque Header
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Coordinator.homeViewHeader_id, for: indexPath) as! CollectionViewHeaderCell
            return header
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width / 2 - 1, height: collectionView.frame.height / 3)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 2
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 2
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return pastors.count
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            parent.isSelectionPastor = true
            parent.getIndex(pastor: self.parent.pastors[indexPath.row])
        }
        
        
        // Deque Cell
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Coordinator.homeViewCell_id, for: indexPath) as! HomeCollectionCell
            return cell
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) ->  UICollectionViewController {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)
        let homeView = UICollectionViewController(collectionViewLayout: layout)
        
        homeView.collectionView.backgroundColor = .clear
        homeView.collectionView.delegate = context.coordinator
        homeView.collectionView.dataSource = context.coordinator
        
        // Cell Register
        homeView.collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: Coordinator.homeViewCell_id)
        
        // Header Register
        homeView.collectionView.register(CollectionViewHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Coordinator.homeViewHeader_id)
        
        homeView.collectionView.alwaysBounceVertical = true
        return homeView
    }
    
    func updateUIViewController(_ uiViewController: UICollectionViewController, context: Context) {
        uiViewController.collectionView.reloadData()
    }
}
