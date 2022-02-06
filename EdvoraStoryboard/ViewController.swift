//
//  ViewController.swift
//  EdvoraAssessment
//
//  Created by Margi  Bhatt on 06/02/22.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var myView: UIView!
    
    @IBOutlet var table: UITableView!
    
    var models = [Model]()
    
    let strURL = "https://assessment-edvora.herokuapp.com/"

    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = [
            "Products",
            "State",
            "City"
        ]
        menu.cellNib = UINib(nibName: "MyCell", bundle: nil)
        menu.customCellConfiguration = { index, title, cell in
            guard let cell = cell as? MyCell else {
                return
            }
        }
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myView.backgroundColor = .blue
//        navigationController?.navigationBar.topItem?.titleView = myView
        guard let topView = myView else {
            return
        }
        
        menu.anchorView = topView
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapTopItem))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        topView.addGestureRecognizer(gesture)
        
        menu.selectionAction = {index, title in
            print("index \(index)")
        }
        
        models.append(Model(image: UIImage(systemName: "pencil")!, productName: "Product 1", brandName: "Brand 1", amount: "Amount 1", location: "Location 1", date: "Date 1", description: "Description 1"))
        
        models.append(Model(image: UIImage(systemName: "pencil")!, productName: "Product 2", brandName: "Brand 2", amount: "Amount 2", location: "Location 2", date: "Date 2", description: "Description 2"))
        models.append(Model(image: UIImage(systemName: "pencil")!, productName: "Product 3", brandName: "Brand 3", amount: "Amount 3", location: "Location 3", date: "Date 3", description: "Description 3"))
        models.append(Model(image: UIImage(systemName: "pencil")!, productName: "Product 4", brandName: "Brand 4", amount: "Amount 4", location: "Location 4", date: "Date 4", description: "Description 4"))
        models.append(Model(image: UIImage(systemName: "pencil")!, productName: "Product 5", brandName: "Brand 5", amount: "Amount 5", location: "Location 5", date: "Date 5", description: "Description 5"))
        models.append(Model(image: UIImage(systemName: "pencil")!, productName: "Product 6", brandName: "Brand 6", amount: "Amount 6", location: "Location 6", date: "Date 6", description: "Description 6"))
        models.append(Model(image: UIImage(systemName: "pencil")!, productName: "Product 7", brandName: "Brand 7", amount: "Amount 7", location: "Location 7", date: "Date 7", description: "Description 7"))
        models.append(Model(image: UIImage(systemName: "pencil")!, productName: "Product 8", brandName: "Brand 8", amount: "Amount 8", location: "Location 8", date: "Date 8", description: "Description 8"))
        models.append(Model(image: UIImage(systemName: "pencil")!, productName: "Product 9", brandName: "Brand 9", amount: "Amount 9", location: "Location 9", date: "Date 9", description: "Description 9"))
        
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        callAPIforGetInfo()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return 1
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    @objc func didTapTopItem() {
        menu.show()
    }
    
    func callAPIforGetInfo(){
        
        AF.request(strURL).responseJSON { response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let count = json.count
                print(count)
                for i in 0..<count{
                    print(json[i]["product_name"])
                }
            case .failure(let error):
                print(error)
        }
        
    
    }

}

}


struct Model {
    let image: UIImage
    let productName: String
    let brandName: String
    let amount: String
    let location: String
    let date: String
    let description: String
    
    init(image: UIImage, productName: String, brandName: String, amount: String, location: String, date: String, description: String) {
        self.image = image
        self.productName = productName
        self.brandName = brandName
        self.amount = amount
        self.location = location
        self.date = date
        self.description = description
    }
}
