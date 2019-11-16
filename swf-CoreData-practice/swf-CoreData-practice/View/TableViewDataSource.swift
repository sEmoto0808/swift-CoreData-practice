//
//  TableViewDataSource.swift
//  swf-CoreData-practice
//
//  Created by 江本匠 on 2019/11/17.
//  Copyright © 2019 S.Emoto. All rights reserved.
//

import UIKit

final class TableViewDataSource: NSObject {

    private var coffeeBeans = [CoffeeBean]()
    
    func fetch(coffeeBeans: [CoffeeBean]) {
        self.coffeeBeans = coffeeBeans
    }
}

extension TableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeBeans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                                 for: indexPath)
        cell.textLabel?.text = coffeeBeans[indexPath.row].countryName
        return cell
    }
}
