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
        animalMaxCount = userChoseAnimal(animalChosen: animalChosen)
        
        // Отобразил результаты на экране
        animalChosenLabel.text = "Вы - \(animalMaxCount.rawValue)!"
        animalChosenDescription.text = animalMaxCount.definition
    }
    
    private func userChoseAnimal(animalChosen: [AnimalType]) -> AnimalType {
        var animals: [AnimalType : Int] = [AnimalType.dog : 0,
                                           AnimalType.cat : 0,
                                           AnimalType.rabbit : 0,
                                           AnimalType.turtle : 0]
        for animal in animalChosen{
            switch animal{
            case .dog:
                animals[.dog]! += 1
            case .cat:
                animals[.cat]! += 1
            case .rabbit:
                animals[.rabbit]! += 1
            case .turtle:
                animals[.turtle]! += 1
            }
        }
        
        let animalMaxCount = animals.max{ $0.1 < $1.1 }

        return animalMaxCount!.key
    }

}
