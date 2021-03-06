//
//  PokeCell.swift
//  pokedex-app
//
//  Created by Amadeu Andrade on 12/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    
    // MARK: - Properties
    
    var pokemon: Pokemon!
    
    
    // MARK: - Cell Display
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    
    // MARK: - Cell Configuration
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        pokemonName.text = self.pokemon.name.capitalizedString
        pokemonImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }


}
