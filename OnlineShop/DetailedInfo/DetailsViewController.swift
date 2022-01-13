import UIKit

class DetailsViewController: UIViewController {
    
    var product: Product
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        configure()
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title: \(product.title)"
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description: \(product.productDescription ?? "")"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price: \(product.price.asLocaleCurrency)"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.text = "Model: \(product.model)"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var vinLabel: UILabel = {
        let label = UILabel()
        label.text = "VIN: \(product.vin)"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.setCustomImage(product.imageURL)
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 30
        return iv
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        return button
    }()
}

extension DetailsViewController {
    
    @objc func addToCartButtonTapped() {
        print("put request where isAddedToCart activated")
    }
    
    internal func configure() {
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.addSubview(modelLabel)
        view.addSubview(vinLabel)
        view.addSubview(imageView)
        view.addSubview(addToCartButton)
    }
    
    private func configureConstraints() {
        setTitleConstraints()
        setDescriptionConstraints()
        setPriceConstraints()
        setModelConstraints()
        setVinConstraints()
        setImageConstraints()
        setAddToCartButtonConstraints()
    }
    
    // MARK: - Set Constraints
    
    private func setTitleConstraints() { // #1
        let margins = view.layoutMarginsGuide
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setDescriptionConstraints() { // #5
        let margins = view.layoutMarginsGuide
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: vinLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setPriceConstraints() { // #2
        let margins = view.layoutMarginsGuide
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setModelConstraints() { // #3
        let margins = view.layoutMarginsGuide
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        modelLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setVinConstraints() { // #4
        let margins = view.layoutMarginsGuide
        vinLabel.translatesAutoresizingMaskIntoConstraints = false
        vinLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        vinLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setImageConstraints() { // #0
        let margins = view.layoutMarginsGuide
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/3).isActive = true
        imageView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
    }
    
    private func setAddToCartButtonConstraints() {
        let margins = view.layoutMarginsGuide
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20).isActive = true
        addToCartButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        addToCartButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addToCartButton.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        addToCartButton.layer.cornerRadius = 20
    }
}
