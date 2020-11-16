//
//  StarWarsViewController.swift
//  StarWarsInfoApp
//
//  Created by Alexander Pismenskiy on 13.11.2020.
//

import UIKit

class CartoonHeroesViewController: UITableViewController {
    
    var heroes: [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }
    
// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroCell

        let hero = heroes[indexPath.row]
        cell.configure(with: hero)

        return cell
    }
}

// MARK: - Networking
extension CartoonHeroesViewController {
    func fetchHeroes() {
        guard let url = URL(string: URLExamples.randomHeroes.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.heroes = try JSONDecoder().decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
