//
//  HeroCell.swift
//  StarWarsInfoApp
//
//  Created by Alexander Pismenskiy on 14.11.2020.
//

import UIKit

class HeroCell: UITableViewCell {
    
    @IBOutlet var imageOfHero: UIImageView!
    @IBOutlet var nameOfHeroLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    
    func configure (with hero: Hero) {
        nameOfHeroLabel.text = hero.name
        genderLabel.text = "Gender: \(hero.gender ?? "No name")"
        speciesLabel.text = "Species: \(hero.species ?? "Uncknown")"
        
        DispatchQueue.global().async {
            guard let stringURL = hero.image else { return }
            guard let image = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: image) else { return }
            
            DispatchQueue.main.async {
                self.imageOfHero.image = UIImage(data: imageData)
            }
        }
    }
}
