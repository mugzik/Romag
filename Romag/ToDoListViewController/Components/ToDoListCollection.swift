//
//  ToDoListCollection.swift
//  Romag
//
//  Created by Maksim on 21.08.2024.
//

import UIKit

private let reuseIdentifier = "Cell"

protocol ToDoListRmDelegate {
    func removeElement(elem: ToDoData)
}

class ToDoListCollection: UICollectionView {
    private var model: [ToDoData] = []
    var rmDelegate: ToDoListRmDelegate?

    init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElement(elem: ToDoData)
    {
        model.append(elem)
    }
    
}

extension ToDoListCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tdcell", for: indexPath) as! ToDoListCell
        
        cell.configure(model: model[indexPath.item], id:indexPath.item)
        cell.delegate = self
        
        return cell
    }
    
    
}

extension ToDoListCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 32
        return CGSize(width: width, height: 64)
    }
}

private extension ToDoListCollection {
    func setup()
    {
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        register(ToDoListCell.self, forCellWithReuseIdentifier: "tdcell" )
        
        delegate = self
        dataSource = self
    }
}

extension ToDoListCollection: ToDoRemoveDelegate {
    func removeToDoCell(id: Int) {
        let rmObject = model.remove(at: id)
        debugPrint("Object removed from list: \(rmObject.message ?? "NA")")
        
        if let delegate = rmDelegate {
            delegate.removeElement(elem: rmObject)
        }
            
        reloadData()
    }
    
}
