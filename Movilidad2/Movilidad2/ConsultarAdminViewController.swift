//
//  ConsultarAdminViewController.swift
//  Movilidad2
//
//  Created by Ivo Sam on 5/7/18.
//  Copyright © 2018 Ivo Sam. All rights reserved.
//

import UIKit

class ConsultarAdminViewController: UIViewController {
    
    @IBOutlet weak var universidadesLabel: UILabel!
    @IBOutlet weak var convocatoriaLabel: UILabel!
    @IBOutlet weak var resultadosLabel: UILabel!
    
    @IBOutlet weak var urlUniTextField: UITextField!
    @IBOutlet weak var urlConvoTextField: UITextField!
    @IBOutlet weak var urlResTextField: UITextField!
    
    @IBAction func aceptarButton(_ sender: Any) {
    }
    
    
    
    @IBOutlet var imagen2ImageView: UIImageView!
    
    
    var movilidad : Formulario?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagen2ImageView.layer.cornerRadius = 24
        //        navigationItem.title = movilidad?.tipo.capitalized
        //        navigationController?.navigationBar.prefersLargeTitles = true
        imagen2ImageView.image = movilidad?.imagen
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
