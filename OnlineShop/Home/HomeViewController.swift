import UIKit

class HomeViewController: UIViewController {
    
    var tableView = UITableView()
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        products = ApiManager.shared.getProductsJson()
        configure()
    }
}

extension HomeViewController {
    
    internal func configure() {
        configureTableView()
        setTableViewDelegates()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        tableView.pin(to: view)
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dest = DetailsViewController()
        dest.product = products[indexPath.row]
        self.navigationController?.show(dest, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as? ProductCell
        let product = products[indexPath.row]
        cell!.set(product: product)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        products.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        print("Delete request")
    }
}
