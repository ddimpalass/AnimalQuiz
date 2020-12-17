//
//  FinalViewController.swift
//  AnimalQuiz
//
//  Created by Екатерина Батеева on 10.12.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var animalChosenLabel: UILabel!
    @IBOutlet weak var animalChosenDescription: UILabel!
    
    // Передал массив с ответами
    var animalChosen: [AnimalType] = []
    
    private var animalMaxCount: AnimalType = .cat

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Избавился от кнопки возврата на предыдущий экран
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        // Определил наиболее часто встречающийся тип животного
        animalMaxCount = getMostChosenAnimal(animalChosen: animalChosen)
        
        // Отобразил результаты на экране
        animalChosenLabel.text = "Вы - \(animalMaxCount.rawValue)!"
        animalChosenDescription.text = animalMaxCount.definition
    }
    
    private func getMostChosenAnimal(animalChosen: [AnimalType]) -> AnimalType {
        var animals: [AnimalType : Int] = [AnimalType.dog : 0,
                                           AnimalType.cat : 0,
                                           AnimalType.rabbit : 0,
                                           AnimalType.turtle : 0]
        
        animalChosen.forEach {
            if let animal = animals[$0] {
                animals[$0] = animal + 1
            }
        }
        
        let animalMaxCount = animals.max{ $0.1 < $1.1 }?.key ?? .dog
        return animalMaxCount
    }

}
