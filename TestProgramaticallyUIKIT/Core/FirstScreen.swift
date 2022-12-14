//
//  ViewController.swift
//  TestProgramaticallyUIKIT
//
//  Created by nur kholis on 14/12/22.
//

import UIKit


struct Person {
    let id: String
    let name: String
}

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
    
    lazy var tableView: UITableView = {
        let tbl = UITableView()
        return tbl
    }()
    
    let data: [Person] = [
            Person(id: "1", name: "Ahmad"),
            Person(id: "2", name: "Bagas"),
            Person(id: "3", name: "Rio"),
            Person(id: "4", name: "Ivan"),
            Person(id: "1", name: "David"),
            Person(id: "1", name: "Martin")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "first screen"
//        setup()
        tableView = UITableView(frame: .zero)
        self.view = tableView
        setupTbl()
    
    }
    
    func setupTbl() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setup() {
        view.backgroundColor = .systemMint
        // add component to supeview
        view.addSubview(nextButton)
        view.addSubview(_testView)
        
        _testView.addSubview(subButton)
        _testView.addSubview(tableView)
        
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
//            _testView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -20),
//            _testView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            _testView.heightAnchor.constraint(equalToConstant: 1000)
        ])
        
        // To activate nscontraint subbutton
        NSLayoutConstraint.activate([
            subButton.centerXAnchor.constraint(equalTo: _testView.centerXAnchor, constant: 15),
            subButton.topAnchor.constraint(equalTo: _testView.topAnchor, constant: 10),
            subButton.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -20),
            subButton.widthAnchor.constraint(equalToConstant: 200),
            subButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // to activate nsconstraint tablecell
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: subButton.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: _testView.bottomAnchor, constant: -20),
//            tableView.centerYAnchor.constraint(equalTo: _testView.centerYAnchor)
        ])
    
    }
    
    @objc func goToNextScreen() {
        let vc = SecondScreen()
        vc.title = "second screen"
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension FirstScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell {
            cell.textLabel?.text = data[indexPath.row].name
            cell.setupCell(image: "PlaceholderImage")
            return cell
        }
        fatalError("could not dequeueReusableCell")
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

