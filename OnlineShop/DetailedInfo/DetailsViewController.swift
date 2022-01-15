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
        setSubViews()
        setConstraints()
    }
    
    private func setSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(modelLabel)
        contentView.addSubview(vinLabel)
        contentView.addSubview(imageView)
        view.addSubview(addToCartButton)
    }
    
    private func setConstraints() {
        setScrollViewConstraints()
        setTitleConstraints()
        setDescriptionConstraints()
        setPriceConstraints()
        setModelConstraints()
        setVinConstraints()
        setImageConstraints()
        setAddToCartButtonConstraints()
    }
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title: \(product.title)"
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description: \(product.productDescription ?? "")"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price: \(product.price.asLocaleCurrency)"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Model: \(product.model)"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var vinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VIN: \(product.vin)"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setCustomImage(product.imageURL)
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 30
        return iv
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add to Cart", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func addToCartButtonTapped() {
        print("put request where isAddedToCart activated")
    }
    
    // MARK: - Set Constraints
    
    private func setScrollViewConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: addToCartButton.layoutMarginsGuide.topAnchor, constant: -20),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor)
        ])
        
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow
        
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight
        ])
    }
    
    private func setTitleConstraints() { // #1
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        ])
    }
    
    private func setDescriptionConstraints() { // #5
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: margins.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: margins.rightAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: vinLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func setPriceConstraints() { // #2
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            priceLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func setModelConstraints() { // #3
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            modelLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            modelLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func setVinConstraints() { // #4
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            vinLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            vinLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func setImageConstraints() { // #0
        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalTo: margins.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4),
            imageView.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
        
    }
    
    private func setAddToCartButtonConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            addToCartButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
            addToCartButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            addToCartButton.heightAnchor.constraint(equalToConstant: 60),
            addToCartButton.widthAnchor.constraint(equalTo: margins.widthAnchor)
        ])
    }
    
}
