//
//  ViewController.swift
//  TestProgramaticallyUIKIT
//
//  Created by nur kholis on 14/12/22.
//

import UIKit

class FirstScreen: UIViewController {

    lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.configuration = .filled()
        btn.configuration?.baseBackgroundColor = .systemPink
        btn.configuration?.title = "Next"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var _testView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var subButton: UIButton = {
        let btn = UIButton()
        btn.configuration = .filled()
        btn.configuration?.baseBackgroundColor = .blue
        btn.configuration?.title = "Sub"
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "first screen"
        setup()
    }
    
    func setup() {
        view.backgroundColor = .systemMint
        // add component to supeview
        view.addSubview(nextButton)
        view.addSubview(_testView)
        _testView.addSubview(subButton)
        
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        
        
        // To activate nscontraint nextbutton
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // To activate nscontraint testview
        NSLayoutConstraint.activate([
            _testView.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 8.0),
            _testView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            _testView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
//            _testView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
//            _testView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            _testView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // To activate nscontraint subbutton
        NSLayoutConstraint.activate([
            subButton.centerXAnchor.constraint(equalTo: _testView.centerXAnchor, constant: 15),
            subButton.centerYAnchor.constraint(equalTo: _testView.centerYAnchor),
            subButton.widthAnchor.constraint(equalToConstant: 200),
            subButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    
    }
    
    @objc func goToNextScreen() {
        let vc = SecondScreen()
        vc.title = "second screen"
        navigationController?.pushViewController(vc, animated: true)
    }
}

/* Note :
 untuk membuat constraint secara manual maka yang harus kita lakukan adalah :
 
 1. hapus storyboard di info plist
 2. hapus storyboard Mains di pencarian storyboard
 3. setting scene delegate untuk menentukan root view controller dan navigasinya
 4. mulai coding di first screen anda bisa merefactor nama filenya
 
  *** sekian terimakasih ***
 */

