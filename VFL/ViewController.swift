import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Görünümleri ve düzenleri tanımlayın
        let label1 = createLabel(text: "Label1", color: .red)
        let label2 = createLabel(text: "Label2", color: .blue)
        
        let label3 = createLabel(text: "Label1", color: .red)
        let label4 = createLabel(text: "Label2", color: .blue)
        
        let label5 = createLabel(text: "Label1", color: .red)
        let label6 = createLabel(text: "Label2", color: .blue)
        
        let label7 = createLabel(text: "Label1", color: .red)
        let label8 = createLabel(text: "Label2", color: .blue)
        
        // Otomatik boyutlandırma kısıtlamalarını devre dışı bırakma
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        label4.translatesAutoresizingMaskIntoConstraints = false
        label5.translatesAutoresizingMaskIntoConstraints = false
        label6.translatesAutoresizingMaskIntoConstraints = false
        label7.translatesAutoresizingMaskIntoConstraints = false
        label8.translatesAutoresizingMaskIntoConstraints = false

        // Görünümleri ekleme
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        view.addSubview(label6)
        view.addSubview(label7)
        view.addSubview(label8)
        
        createVFL(label1: label1, label2: label2, formats: example1())
        createVFL(label1: label3, label2: label4, formats: example2(top: 200))
        createVFL(label1: label5, label2: label6, formats: example3(top: 300))
        createVFL(label1: label7, label2: label8, formats: example4(top: 500))
    }
    
    func createVFL(label1: Any, label2: Any, formats: [String]) {
        guard let label1 = label1 as? UIView,
                let label2 = label2 as? UIView
        else { return }
        
        arrangeVFL(label1: label1,
                   label2: label2,
                   formats: formats)
    }
    
    // MARK: Example 1
    func example1(top: Double = 50) -> [String] {

        // VFL format dizesi kullanarak düzenleri tanımlayın
        let horizontalFormat = "|-[label1]-20-[label2]-|"
        let equalWidth = "[label1(==label2)]"
        let verticalFormatLabel1 = "V:|-\(top)-[label1]"
        let verticalFormatLabel2 = "V:|-\(top)-[label2]"
        let height1 = "V:[label1(100)]"
        let height2 = "V:[label2(100)]"
        
        return [horizontalFormat,equalWidth,verticalFormatLabel1,verticalFormatLabel2,height1,height2]
        
    }
    
    // MARK: Example 2
    func example2(top: Double = 50) -> [String] {

        // VFL format dizesi kullanarak düzenleri tanımlayın
        let horizontalFormat = "|-[label1]-50-[label2]-|"
        let verticalFormatLabel1 = "V:|-\(top)-[label1]"
        let verticalFormatLabel2 = "V:|-\(top)-[label2]"
        let height1 = "V:[label1(60)]"
        let height2 = "V:[label2(60)]"
        
        return [horizontalFormat,verticalFormatLabel1,verticalFormatLabel2,height1,height2]
        
    }
    
    // MARK: Example 3
    func example3(top: Double = 50) -> [String] {
        
        // VFL format dizesi kullanarak düzenleri tanımlayın
        let horizontalFormat = "|-[label1]-50-[label2]-|"
        let verticalFormatLabel1 = "V:|-\(top + 100)-[label1]"
        let verticalFormatLabel2 = "V:|-\(top)-[label2]"
        let height1 = "V:[label1(40)]"
        let height2 = "V:[label2(60)]"
        
        return [horizontalFormat,verticalFormatLabel1,verticalFormatLabel2,height1,height2]
        
    }
    
    // MARK: Example 4
    func example4(top: Double = 50) -> [String] {
    
        // VFL format dizesi kullanarak düzenleri tanımlayın
        let horizontalFormat = "|-[label1]-|"
        let horizontalFormat2 = "|-[label2]-|"
        let verticalFormatLabel1 = "V:|-\(top)-[label1]"
        let verticalFormatLabel2 = "V:[label1]-10-[label2]"
        let height1 = "V:[label1(60)]"
        let height2 = "V:[label2(60)]"
        
        return [horizontalFormat, horizontalFormat2,verticalFormatLabel1,verticalFormatLabel2,height1,height2]
        
    }
    
    func arrangeVFL(label1: Any, label2: Any, formats: [String]) {
        
        // Tüm görünümleri içeren views sözlüğü
        let views: [String: Any] = ["label1": label1, "label2": label2]

        // NSLayoutConstraint yöntemiyle kısıtlamaları oluşturma
        for format in formats {
            let constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: views)
            // Kısıtlamaları etkinleştirme
            NSLayoutConstraint.activate(constraints)
        }
        
    }
    
    func createLabel(text: String, color: UIColor) -> UILabel {
        return {
            let label = UILabel()
            label.text = text
            label.backgroundColor = color
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
    
    }
}
