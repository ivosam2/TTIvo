//
//  ViewController.swift
//  Movilidad2
//
//  Created by Ivo Sam on 5/6/18.
//  Copyright © 2018 Ivo Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet var convocatoriasTableView: UITableView!
    
    var movilidadFecha = ["2018", "2017", "2016", "2015"]
    
    var movilidad = [
        Formulario(tipo: "nacional"),
        Formulario(tipo: "internacional"),
        Formulario(tipo:"posgrado")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        convocatoriasTableView.delegate = self
        convocatoriasTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ConsultarViewController {
            destination.movilidad = movilidad[(convocatoriasTableView.indexPathForSelectedRow?.row)!]
        }
        let backItem = UIBarButtonItem()
        backItem.title = "Atrás"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let backItem = UIBarButtonItem()
//        backItem.title = "Atrás"
//        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movilidadFecha.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = movilidadFecha[section]
        label.backgroundColor = UIColor.lightGray
        label.textAlignment = .center
        return label
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movilidad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = movilidad[indexPath.row].tipo.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToSelection", sender: self)
    }
}

