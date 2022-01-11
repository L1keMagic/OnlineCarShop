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
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
       let label = UILabel()
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
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    private func setTitleLabelConstraints() {
        productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        productTitleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20).isActive = true
        productTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        productTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    private func setPriceLabelConstraints() {
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20).isActive = true
        productPriceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor).isActive = true
        productPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
