//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Swagat on 12/17/22.
//

import UIKit

class ViewController: UIViewController {

	let color: [UIColor] = [
		.systemPink,
		.systemRed,
		.systemCyan,
		.systemGray,
		.systemMint,
		.systemTeal,
		.systemIndigo,
		.systemYellow,
		.systemOrange,
		.systemBrown
	]
	
	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.backgroundColor = .white
		return imageView
	}()
	
	private let button: UIButton = {
		let button = UIButton()
		button.setTitle("Show Image", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = .black
		return button
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemRed
		view.addSubview(imageView)
		imageView.frame = CGRect(x: 150, y: 300, width: 300, height: 300)
		imageView.center = view.center
		
		view.addSubview(button)
		

		getRandomPhoto()
		
		button.addTarget(self, action: #selector(getRandomPhoto), for: .touchDown)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		button.frame = CGRect(
			x: 20,
			y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
			width: view.frame.size.width - 40,
			height: 100
		)
		
	}

	@objc func getRandomPhoto() {
		let urlString = "https://source.unsplash.com/random/600x600"
		let url = URL(string: urlString)!
		guard let data = try? Data(contentsOf: url) else {return } //What the hell is guard? Google. Also search "try?" syntax.
		imageView.image = UIImage(data: data)
		view.backgroundColor = color.randomElement()
		button.backgroundColor = color.randomElement()
		
	}

}


