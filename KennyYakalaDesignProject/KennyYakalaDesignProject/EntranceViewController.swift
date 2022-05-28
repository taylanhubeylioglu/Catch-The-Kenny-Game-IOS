//
//  EntranceViewController.swift
//  KennyYakalaDesignProject
//
//  Created by Taylan Hubeylioğlu on 9.04.2022.
//

import UIKit

class EntranceViewController: UIViewController {
    
    @IBOutlet weak var kennyWelcomeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kennyWelcomeImageView.loadGif(name: "kennygif")
        
    }
    
    @IBAction func btnStart(_ sender: Any) {
        performSegue(withIdentifier: "goToGameSegue", sender: nil)
        
    }
    

}
