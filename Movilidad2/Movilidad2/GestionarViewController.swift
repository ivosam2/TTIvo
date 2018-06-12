//
//  GestionarViewController.swift
//  Movilidad2
//
//  Created by Ivo Sam on 5/6/18.
//  Copyright © 2018 Ivo Sam. All rights reserved.
//

import UIKit
import Firebase

class GestionarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var gestionarConvocatoriasTableView: UITableView!
    
    var movilidadFecha = ["Agosto-Diciembre 2018", "Enero-Junio 2017", "Agosto-Diciembre 2017"]
    
    var movilidad = [
        Formulario(tipo: "nacional"),
        Formulario(tipo: "internacional"),
        Formulario(tipo:"posgrado")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
        
        gestionarConvocatoriasTableView.delegate = self
        gestionarConvocatoriasTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    @IBAction func agregarBtn(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Convocatoria de movilidad", message: "Ingrese el año en el que se realizará la convocatoria", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Año"
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        let action = UIAlertAction(title: "Agregar", style: .default) { (_) in
            let fecha = alert.textFields!.first!.text!
            self.movilidadFecha.insert(fecha, at: 0)
            self.gestionarConvocatoriasTableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
//        let action2 = UIAlertAction(title: "Agregar", style: .default) { (_) in
//            let fecha = alert.textFields!.first!.text!
//            ViewController.movilidadFecha.insert(fecha, at: 0)
//            ViewController.convocatoriasTableView.reloadData()
//        }
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
    }
    
    //Nos permite pasar a la pantalla de Consultar convocatorias y establece la palabra "atrás" en el navigation bar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ConsultarAdminViewController {
            destination.movilidad = movilidad[(gestionarConvocatoriasTableView.indexPathForSelectedRow?.row)!]
        }
        let backItem = UIBarButtonItem()
        backItem.title = "Atrás"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        
    }
    
    //Nos permite salir de la sesión actual de administrador
    @IBAction func salirBtn(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
            
        }
        catch {
            print("there was a problem signing out.")
        }
        
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
        performSegue(withIdentifier: "goToSelection2", sender: self)
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
