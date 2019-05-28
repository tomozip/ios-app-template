dep:
	carthage bootstrap --platform ios --cache-builds
	pod install
gen:
	Pods/SwiftGen/bin/swiftgen config run
