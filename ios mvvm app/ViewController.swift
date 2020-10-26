//
//  ViewController.swift
//  ios mvvm app
//
//  Created by ahmedelbasha on 10/25/20.
//  Copyright © 2020 ahmedelbasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tblView: UITableView!
    var viewmodel = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewmodel.GetDataFromAPIHandlerClass(URL: EndPoint.strURL) { (_) in
            DispatchQueue.main.async { [weak self] in
                self?.tblView.reloadData()
            }
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  viewmodel.GetNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let  cell = tblView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = viewmodel.getCellData(index: indexPath.row)
        return cell!
        
        
    }
    
        
    }



