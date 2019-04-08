//
//  RootViewController.swift
//  GifInUIImageView
//
//  Created by Alex Nagy on 08/04/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import TinyConstraints
import Gifu

class RootViewController: UIViewController {
    
    lazy var loadingGif: GIFImageView = {
        let view = GIFImageView()
        view.contentMode = .scaleAspectFit
        view.animate(withGIFNamed: "loading")
        view.stopAnimatingGIF()
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        button.layer.cornerRadius = 7
        button.layer.masksToBounds = true
        button.setTitle("Fetch Image", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(#colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.1529411765, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func buttonTapped() {
        if !loadingGif.isAnimatingGIF {
            loadingGif.startAnimatingGIF()
            
            DispatchQueueHelper.delay(bySeconds: 5) {
                self.imageView.image = #imageLiteral(resourceName: "Dog.png").withRenderingMode(.alwaysOriginal)
                self.loadingGif.stopAnimatingGIF()
                self.loadingGif.alpha = 0.0
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    fileprivate func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.05490196078, green: 0.06666666667, blue: 0.1215686275, alpha: 1)
        
        view.addSubview(loadingGif)
        view.addSubview(imageView)
        view.addSubview(button)
        
        loadingGif.centerInSuperview()
        loadingGif.width(view.frame.width)
        loadingGif.height(view.frame.width)
        loadingGif.leftToSuperview()
        loadingGif.rightToSuperview()
        
        imageView.centerXToSuperview()
        imageView.topToSuperview(offset: 36, usingSafeArea: true)
        imageView.width(150)
        imageView.height(150)
        
        button.topToBottom(of: imageView, offset: 24)
        button.leftToSuperview(offset: 12)
        button.rightToSuperview(offset: -12)
        button.height(50)
    }

}

