import UIKit

class ProductCell: UITableViewCell {
    
    static let identifier = "ProductCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var productImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
}

extension ProductCell {
    
    internal func configure() {
        addSubviews()
        configureConstraints()
    }
    
    func set(product: Product) {
        productImageView.setCustomImage(product.imageURL)
        productTitleLabel.text = product.title
        productPriceLabel.text = product.price.asLocaleCurrency
    }
    
    private func addSubviews() {
        addSubview(productImageView)
        addSubview(productTitleLabel)
        addSubview(productPriceLabel)
    }
    
    private func configureConstraints() {
        setImageViewConstraints()
        setTitleLabelConstraints()
        setPriceLabelConstraints()
    }
    
    private func setImageViewConstraints() {
        NSLayoutConstraint.activate([
            productImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            productImageView.heightAnchor.constraint(equalToConstant: 80),
            productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor, multiplier: 16/9)
        ])
    }
    
    private func setTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            productTitleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            productTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            productTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    private func setPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            productPriceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            productPriceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor),
            productPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
        
    }
}
