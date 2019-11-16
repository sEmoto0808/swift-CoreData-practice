//
//  ViewController.swift
//  swf-CoreData-practice
//
//  Created by 江本匠 on 2019/11/17.
//  Copyright © 2019 S.Emoto. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var countryNameTextField: UITextField!
    @IBOutlet weak var coffeeBeanTableView: UITableView!
    
    // MARK: - Properties
    
    private let controller = CoreDataController()
    private let dataSource = TableViewDataSource()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.fetch(coffeeBeans: controller.fetch(entityName: "CoffeeBean"))
        coffeeBeanTableView.dataSource = dataSource
    }

    // MARK: - IBAction
    
    @IBAction func didTapSave(_ sender: Any) {
        if controller.add(countryName: countryNameTextField.text) {
            controller.saveContext()
            dataSource.fetch(coffeeBeans: controller.fetch(entityName: "CoffeeBean"))
            coffeeBeanTableView.reloadData()
            countryNameTextField.text = nil
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        countryNameTextField.resignFirstResponder()
    }
}
