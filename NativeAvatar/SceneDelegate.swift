//
//  SceneDelegate.swift
//  NativeAvatar
//
//  Created by Yernar Masujima on 22.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		window = UIWindow(windowScene: windowScene)
		window?.rootViewController = UINavigationController(rootViewController: TestViewController())
		window?.makeKeyAndVisible()
	}
}
