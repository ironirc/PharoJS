Class {
	#name : 'PjMultipageExpressExampleApp',
	#superclass : 'PjExpressApp',
	#category : 'PharoJs-Examples-ExpressJS',
	#package : 'PharoJs-Examples',
	#tag : 'ExpressJS'
}

{ #category : 'accessing' }
PjMultipageExpressExampleApp class >> clientAppClasses [
	^ PjMultipageExpressClientExampleApp subclasses
]

{ #category : 'accessing' }
PjMultipageExpressExampleApp class >> publicStaticFilesFolderName [

	^ 'pages'
]
