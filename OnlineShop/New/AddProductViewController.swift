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
        label.text = "Title:*"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description:"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price:*"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()

    lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.text = "Model:*"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()

    lazy var vinLabel: UILabel = {
        let label = UILabel()
        label.text = "VIN:*"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()

    lazy var titleTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()

    lazy var descriptionTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()

    lazy var priceTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()

    lazy var modelTF: UITextField = {
        let         textField = UITextField()
                textField.backgroundColor = .white
                textField.layer.cornerRadius = 5
                textField.textColor = .black
                textField.autocorrectionType = UITextAutocorrectionType.no
        return         textField
    }()

    lazy var vinTF: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()

    lazy var submitButton: UIButton = {
        let button = UIButton()
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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setTitleTFConstraints() {
        let margins = view.layoutMarginsGuide
        titleTF.translatesAutoresizingMaskIntoConstraints = false
        titleTF.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        titleTF.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 10).isActive = true
        titleTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10).isActive = true
        titleTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    // Description Configuration
    private func setDescriptionLabelConstraints() {
        let margins = view.layoutMarginsGuide
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setDescriptionTFConstraints() {
        let margins = view.layoutMarginsGuide
        descriptionTF.translatesAutoresizingMaskIntoConstraints = false
        descriptionTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionTF.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 10).isActive = true
        descriptionTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10).isActive = true
        descriptionTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    // Price Configuration
    private func setPriceLabelConstraints() {
        let margins = view.layoutMarginsGuide
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setPriceTFConstraints() {
        let margins = view.layoutMarginsGuide
        priceTF.translatesAutoresizingMaskIntoConstraints = false
        priceTF.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        priceTF.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 10).isActive = true
        priceTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10).isActive = true
        priceTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    // Model Configuration
    private func setModelLabelConstraints() {
        let margins = view.layoutMarginsGuide
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
        modelLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10).isActive = true
        modelLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        modelLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setModelTFConstraints() {
        let margins = view.layoutMarginsGuide
        modelTF.translatesAutoresizingMaskIntoConstraints = false
        modelTF.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
        modelTF.leftAnchor.constraint(equalTo: modelLabel.rightAnchor, constant: 10).isActive = true
        modelTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10).isActive = true
        modelTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    // Vin Configuration
    private func setVinLabelConstraints() {
        let margins = view.layoutMarginsGuide
        vinLabel.translatesAutoresizingMaskIntoConstraints = false
        vinLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 20).isActive = true
        vinLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10).isActive = true
        vinLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        vinLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setVinTFConstraints() {
        let margins = view.layoutMarginsGuide
        vinTF.translatesAutoresizingMaskIntoConstraints = false
        vinTF.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 20).isActive = true
        vinTF.leftAnchor.constraint(equalTo: vinLabel.rightAnchor, constant: 10).isActive = true
        vinTF.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10).isActive = true
        vinTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setSubmitButtonConstraints() {
        let margins = view.layoutMarginsGuide
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        submitButton.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        submitButton.layer.cornerRadius = 20
    }
}
