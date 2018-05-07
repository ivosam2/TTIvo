//
//  ConsultarViewController.swift
//  Movilidad2
//
//  Created by Ivo Sam on 5/6/18.
//  Copyright © 2018 Ivo Sam. All rights reserved.
//

import UIKit
import Firebase

class ConsultarViewController: UIViewController {
    
    var movilidad : Formulario?
    
    @IBOutlet var tipoImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
        
        tipoImageView.layer.cornerRadius = 24
//        navigationItem.title = movilidad?.tipo.capitalized
//        navigationController?.navigationBar.prefersLargeTitles = true
        tipoImageView.image = movilidad?.imagen
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
