//
//  ViewController.swift
//  BaseNetworkingWithGCD
//
//  Created by Леонид on 17.06.2021.
//

import UIKit

class mainVC: UIViewController {

    @IBOutlet weak var imageViewForAnimal: UIImageView!
    let networkObj = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dogeDownload(_ sender: UIButton) {
        networkObj.getImageByAlamofire { (image) in
            self.imageViewForAnimal.image = image
        }
    }
    
    @IBAction func kittyDownloadAfterFiveSec(_ sender: UIButton) {
        networkObj.getImageByURLSession { (image) in
            self.imageViewForAnimal.image = image
        }
    }
}

