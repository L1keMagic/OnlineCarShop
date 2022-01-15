import UIKit

class AddProductViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Car"
        view.backgroundColor = .darkGray
        configure()
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title:*"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description:"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price:*"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Model:*"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var vinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VIN:*"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var titleTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()
    
    lazy var descriptionTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()
    
    lazy var priceTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()
    
    lazy var modelTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()
    
    lazy var vinTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()
}

extension AddProductViewController {
    
    internal func configure() {
        addSubviews()
        configureConstraints()
        configureDelegates()
    }
    
    @objc func submitButtonTapped() {
        print("post request where we add new car")
        if let title = titleTF.text,
           let description = descriptionTF.text,
           let price = priceTF.text,
           let model = modelTF.text,
           let vin = vinTF.text {
            print(title, description, price, model, vin)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.titleTF:
            self.descriptionTF.becomeFirstResponder()
        case self.descriptionTF:
            self.priceTF.becomeFirstResponder()
        case self.priceTF:
            self.modelTF.becomeFirstResponder()
        case self.modelTF:
            self.vinTF.becomeFirstResponder()
        default:
            self.vinTF.resignFirstResponder()
        }
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(titleTF)
        
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTF)
        
        view.addSubview(priceLabel)
        view.addSubview(priceTF)
        
        view.addSubview(modelLabel)
        view.addSubview(modelTF)
        
        view.addSubview(vinLabel)
        view.addSubview(vinTF)
        
        view.addSubview(submitButton)
    }
    
    private func configureConstraints() {
        setTitleLabelConstraints()
        setTitleTFConstraints()
        
        setDescriptionLabelConstraints()
        setDescriptionTFConstraints()
        
        setPriceLabelConstraints()
        setPriceTFConstraints()
        
        setModelLabelConstraints()
        setModelTFConstraints()
        
        setVinLabelConstraints()
        setVinTFConstraints()
        
        setSubmitButtonConstraints()
    }
    
    private func configureDelegates() {
        self.titleTF.delegate = self
        self.descriptionTF.delegate = self
        self.priceTF.delegate = self
        self.modelTF.delegate = self
        self.vinTF.delegate = self
    }
    
    // Title Configuration
    private func setTitleLabelConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setTitleTFConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            titleTF.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            titleTF.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 10),
            titleTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
            titleTF.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // Description Configuration
    private func setDescriptionLabelConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 100),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setDescriptionTFConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            descriptionTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionTF.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 10),
            descriptionTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
            descriptionTF.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // Price Configuration
    private func setPriceLabelConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            priceLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
            priceLabel.widthAnchor.constraint(equalToConstant: 100),
            priceLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setPriceTFConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            priceTF.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            priceTF.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 10),
            priceTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
            priceTF.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // Model Configuration
    private func setModelLabelConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            modelLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            modelLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
            modelLabel.widthAnchor.constraint(equalToConstant: 100),
            modelLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setModelTFConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            modelTF.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            modelTF.leftAnchor.constraint(equalTo: modelLabel.rightAnchor, constant: 10),
            modelTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
            modelTF.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // Vin Configuration
    private func setVinLabelConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            vinLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 20),
            vinLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
            vinLabel.widthAnchor.constraint(equalToConstant: 100),
            vinLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setVinTFConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            vinTF.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 20),
            vinTF.leftAnchor.constraint(equalTo: vinLabel.rightAnchor, constant: 10),
            vinTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
            vinTF.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setSubmitButtonConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            submitButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
            submitButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 60),
            submitButton.widthAnchor.constraint(equalTo: margins.widthAnchor)
        ])
    }
}
