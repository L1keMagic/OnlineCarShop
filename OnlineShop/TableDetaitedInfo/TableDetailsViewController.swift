//import UIKit
//
//class TableDetailsViewController: UIViewController {
//    
//    var product: Product!
//    var productInfo: [String] = []
//    var tableView = UITableView()
//    
//    override func viewDidLoad() {
//        productInfo = [
//            product.title,
//            product.productDescription!,
//            "\(product.price)",
//            product.model,
//            product.vin ]
//        
//        super.viewDidLoad()
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(ProductCell.self, forCellReuseIdentifier: "cell")
//        tableView.pin(to: view)
//        
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 250))
//        
//        let imageView: UIImageView = {
//            let iv = UIImageView(frame: header.bounds)
//            iv.setCustomImage(product.imageURL)
//            iv.clipsToBounds = true
//            return iv
//        }()
//        header.addSubview(imageView)
//        
//        tableView.tableHeaderView = header
//        
//    }
//}
//
//extension TableDetailsViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
//
//extension TableDetailsViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return productInfo.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = productInfo[indexPath.row]
//        return cell
//    }
//}
