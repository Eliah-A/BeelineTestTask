//
//  ViewController.swift
//  Beeline Test Task
//
//  Created by Илья Сергеевич on 10.11.2022.
//

import UIKit

class ShopViewController: UICollectionViewController {
    
    private let searchBar = UISearchController(searchResultsController: nil)
    private let cellId = "cellId"
    private var allResults = [ProductModel]()
    private var searchResults = [ProductModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .beelineBack
        collectionView.register(ShopViewCell.self,
                                forCellWithReuseIdentifier: cellId)
        fetchDymmyData ()
        setSearchBar()
    }
    
    private func fetchDymmyData() {
        NetworkService.Shared.fetchDymmyData { [weak self] results, err  in
            guard err == nil else {print("Fetch Data Failed: \(err as Error?)")
                return
            }
            self?.allResults = results
            self?.searchResults = results
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ShopViewCell
        let result = searchResults[indexPath.item]
        cell.cellData = result
        return cell
    }
}

// MARK: - UICollectionViewDelegate Methods

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let spaceBetweenCells:CGFloat = 10
        let numberOfItemsPerRow:CGFloat = 2
        let totalSpacing = (2 * spaceBetweenCells) + ((numberOfItemsPerRow - 1))

        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.width/18
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        let pickedProduct =  searchResults[indexPath.item]
        let DetailVC = DetailViewController(product: pickedProduct)
        DetailVC.navigationItem.title = pickedProduct.title
        self.navigationController?.pushViewController(DetailVC, animated: true)
    }
    
}

// MARK: - UISearchBar Methods

extension ShopViewController: UISearchBarDelegate {
    
    private func setSearchBar() {
        definesPresentationContext = true
        searchBar.searchBar.delegate = self
        searchBar.searchBar.searchTextField.backgroundColor = .beelineYelowOpacity
        searchBar.searchBar.searchTextField.textColor = .black
        searchBar.searchBar.searchTextField.tintColor = .black
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            self.searchResults = self.allResults
        } else {
            self.searchResults = self.allResults.filter({
                $0.title.capitalized.contains(searchText.capitalized)
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchResults = self.allResults
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

