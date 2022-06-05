//
//  ViewController.swift
//  RandomPhotoApp
//
//  Created by Andrey Vanakoff on 05/06/2022.
//

//MARK: - App Description
/*
- Applicatioon is based on practice of Programmatical coding in Swift
- Click on the button and get a random image, plus random background color
 */

import UIKit

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Random Photo App"
        label.font = UIFont(name: "ZapfDingbatsITC", size: 50)
        label.numberOfLines = 0
        return label
    } ()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    } ()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Show Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    } ()
    
    private let colors: [UIColor] = [
        .blue,
        .purple,
        .white,
        .brown,
        .cyan,
        .gray,
        .green,
        .yellow
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        view.addSubview(label)
        label.frame = CGRect(x: 20, y: 50, width: 200, height: 200)
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 50
        )
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        guard let url = URL(string: urlString) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        imageView.image = UIImage(data: data)
    }
}


