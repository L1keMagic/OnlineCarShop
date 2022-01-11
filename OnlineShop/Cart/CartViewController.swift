import UIKit

class CartViewController: UIViewController {
    
    private var tableView = UITableView()
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cart"
        products = ApiManager.shared.getCartProductsJson()
        configure()
    }
}

extension CartViewController {
    
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

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as! ProductCell
        let product = products[indexPath.row]
        cell.set(product: product)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        products.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        print("Put request where we change isAddedToCart to false")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
