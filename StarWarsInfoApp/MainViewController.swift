//
//  ViewController.swift
//  StarWarsInfoApp
//
//  Created by Alexander Pismenskiy on 13.11.2020.
//

import UIKit

enum URLExamples: String {
    case randomHeroes = "https://rickandmortyapi.com/api/character/1,2,3,4,5"
}


class MainViewController: UIViewController {

// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "allHeroes" {
            let cartoonHeroesVC = segue.destination as! CartoonHeroesViewController
            cartoonHeroesVC.fetchHeroes()
        }
    }
    
    @IBAction func tapHereButtonPressed() {
        performSegue(withIdentifier: "allHeroes", sender: nil)
    }
}
