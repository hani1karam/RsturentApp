//
//  HomeVC.swift
//  RsturentApp
//
//  Created by Hany Karam on 2/22/21.
//

import UIKit
import NVActivityIndicatorView

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate,NVActivityIndicatorViewable {

    
    
    @IBOutlet weak var CatrogyCV: UICollectionView!
    @IBOutlet weak var ProductTV: UITableView!
    
    
    var items = [CatrogyModelDatum]() // => Array
    var selectedindex = 0
   // var id:Int?
    var itemProduct = [ProductModelDataClass]()
    override func viewDidLoad() {
        super.viewDidLoad()
        CatrogyCV.delegate = self
        CatrogyCV.dataSource = self
        ProductTV.delegate = self
        ProductTV.dataSource = self
        ShowCatrogy()
     }
    
    func ShowCatrogy(){
        startAnimating(CGSize(width: 45, height: 45), message: "",type: .ballSpinFadeLoader, color: .black, textColor: .white)

        NetWorkManager.instance.API(method: .post, url: "https://restaurant.salemsaber.com/api/allCategories") { (err, status, response:CatrogyModel?) in
            self.stopAnimating()

            guard let data = response?.data else {return}
            self.items = data
            print(response!)
            self.CatrogyCV.reloadData()
        }
    }
    func showProduct(id:Int){
        startAnimating(CGSize(width: 45, height: 45), message: "",type: .ballSpinFadeLoader, color: .black, textColor: .white)

        let param = ["productId":id ?? 1] // => Dictrionry
        NetWorkManager.instance.API(method: .post, url: "https://restaurant.salemsaber.com/api/product",parameters: param) { (err, status, response:ProductModel?) in
            self.stopAnimating()
            guard let data = response?.data else {return}
            self.itemProduct = [data]
            print(response!)
            self.ProductTV.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! HomeCollectionViewCell
        cell.Title.text = items[indexPath.row].name
        if selectedindex == indexPath.row {
            cell.Footer.isHidden = false
        }
        else {
            cell.Footer.isHidden = true

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print(items[indexPath.row].name!)
        print(items[indexPath.row].id!)
        selectedindex = indexPath.row
        showProduct(id: items[indexPath.row].id ?? 1)
        CatrogyCV.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! PrdouctTableViewCell
        cell.name.text = itemProduct[indexPath.row].name
        cell.price.text = "\(itemProduct[indexPath.row].discount!)" + " "  + "جنيه"
        cell.configure(compines: itemProduct[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 227
    }
}
