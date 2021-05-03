//
//  EndViewController.swift
//  GeologyApp
//
//  Created by Wren Amitai on 7/25/19.
//  Copyright © 2019 Wren Amitai. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    var image : UIImage!;
    @IBOutlet weak var animalImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "iceAge")!);
        
        animalImage.image = self.image;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
