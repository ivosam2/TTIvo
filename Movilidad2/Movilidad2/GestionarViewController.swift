//
//  GestionarViewController.swift
//  Movilidad2
//
//  Created by Ivo Sam on 5/6/18.
//  Copyright © 2018 Ivo Sam. All rights reserved.
//

import UIKit
import Firebase

class GestionarViewController: UIViewController {

    @IBOutlet var gestionarConvocatoriasTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func agregarBtn(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func salirBtn(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
            
        }
        catch {
            print("there was a problem signing out.")
        }
        
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
