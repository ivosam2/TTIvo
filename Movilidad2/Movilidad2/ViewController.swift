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
    
    var movilidadFecha = ["Agosto-Diciembre 2018", "Enero-Junio 2017", "Agosto-Diciembre 2017"]
    
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
    
    //Nos permite pasar a la pantalla de Consultar convocatorias y establece la palabra "atrás" en el navigation bar
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
    
    //Establece el número de secciones que habrá en la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return movilidadFecha.count
    }
    
    //Establece las propidades del encabezado de la sección
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = movilidadFecha[section]
        label.backgroundColor = UIColor.lightGray
        label.textAlignment = .center
        return label
    }
    
    //Muestra el número de filas por sección de acuerdo al número de cadenas que haya en el arreglo movilidad
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movilidad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = movilidad[indexPath.row].tipo.capitalized
        return cell
    }
    
    //Establece a que pantalla ir al tocar alguna de las filas, en este caso usa el segue "goToSelection" que va a la consulta de la información de esa fila
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToSelection", sender: self)
    }
}

