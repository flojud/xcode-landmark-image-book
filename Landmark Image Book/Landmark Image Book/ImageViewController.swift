//
//  ImageViewController.swift
//  Landmark Image Book
//
//  Created by Florian Jud on 22.03.17.
//  Copyright © 2017 Florian Jud. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedLandmarkImage
        nameLabel.text = selectedLandmarkName
    }
    
}
