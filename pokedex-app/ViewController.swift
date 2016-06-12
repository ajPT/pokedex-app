//
//  ViewController.swift
//  pokedex-app
//
//  Created by Amadeu Andrade on 11/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - IBOutlets
    
    @IBOutlet weak var collection: UICollectionView!
    
    // MARK: - Properties
    
    var pokemons = [Pokemon]()
    
    // MARK: - View lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        parsePokemonCSV()
    }

    // MARK: - UICollection View methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
            let pokemon = pokemons[indexPath.row]
            //let pokemon = Pokemon(name: "Test", pokedexId: indexPath.row)
            cell.configureCell(pokemon)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: - Parsing CSV
    
    func parsePokemonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows {
                if let pokeName = row["identifier"], let pokeId = Int(row["id"]!) {
                    let pokemon = Pokemon(name: pokeName, pokedexId: pokeId)
                    pokemons.append(pokemon)
                }
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

}

