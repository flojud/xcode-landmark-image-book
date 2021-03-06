//
//  ViewController.swift
//  Landmark Image Book
//
//  Created by Florian Jud on 22.03.17.
//  Copyright © 2017 Florian Jud. All rights reserved.
//

import UIKit

//Bei Verwendung eines TableView Elements, muss der ViewController um den TableViewDelegate und TableViewDataSource erweitert werden. Die Klasse erwartet dann aber auch, dass es zwei tableView Funktionen gibt. Die numberOfRowsInSection und cellForRowAt indesPath.
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //Gloabele Hilfs Arrays
    var landMarkNamesArray = [String]()
    var landMarkImageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView Setup
        tableView.dataSource = self
        tableView.delegate = self
        
        //Example Array
        landMarkNamesArray.append("Colloseum")
        landMarkNamesArray.append("Chinese Wall")
        landMarkNamesArray.append("Kreml")
        landMarkNamesArray.append("Stoneheadge")
        landMarkNamesArray.append("Taj Mahal")
        
        landMarkImageArray.append(UIImage(named: "colloseum.jpg")!)
        landMarkImageArray.append(UIImage(named: "chinesewall.jpg")!)
        landMarkImageArray.append(UIImage(named: "kreml.png")!)
        landMarkImageArray.append(UIImage(named: "stoneheadge.jpg")!)
        landMarkImageArray.append(UIImage(named: "tajmahal.jpg")!)
        
        
        
    }

    
    //Anhand der Einträge im Array werden die Zeilen aufgebaut
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNamesArray.count
    }
   
    
    //Es soll in der Zeile der Name des Arrays stehen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landMarkNamesArray[indexPath.row]
        return cell
    }
    
    
    //Durch die editing Style Funktion kann man in einer Zeile ein Element löschen
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landMarkNamesArray.remove(at: indexPath.row)
            landMarkImageArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    //---------------------------------------------------
    // -- Segue Funktionen
    //---------------------------------------------------
    
    //Globale Variablen zum Übertragen in den ImageViewScreen
    var chossenLandmarkName = ""
    var choosenLandmarkImage = UIImage()
    
    //Bei einer Auswahl Segue durchführen
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chossenLandmarkName = landMarkNamesArray[indexPath.row]
        self.choosenLandmarkImage = landMarkImageArray[indexPath.row]
        performSegue(withIdentifier: "toImageVCSegue", sender: nil)
    }
    
    //Segue ausführen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageVCSegue"{
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedLandmarkName = chossenLandmarkName
            destinationVC.selectedLandmarkImage = choosenLandmarkImage
        }
    }
    
   }

