Class {
	#name : 'PjLocalWebServedBridgeClient',
	#superclass : 'PjWebServedBridgeClient',
	#instVars : [
		'serverBridge'
	],
	#category : 'PharoJs-Base-Bridge-Client-Kernel',
	#package : 'PharoJs-Base-Bridge',
	#tag : 'Client-Kernel'
}

{ #category : 'actions' }
PjLocalWebServedBridgeClient >> initUrlString [

	| serverPort serverApp |
	serverApp := serverBridge
		             evalSelector: #currentInstance
		             sentTo: self serverClass name.
	serverPort := serverApp port.
	self urlString:
		'http://127.0.0.1:' , serverPort asString , self urlPathString
]

{ #category : 'initialization' }
PjLocalWebServedBridgeClient >> reset [
	self serverBridge resetClient.
	super reset.
]

{ #category : 'accessing' }
PjLocalWebServedBridgeClient >> serverApp [

	^ serverBridge app
]

{ #category : 'accessing' }
PjLocalWebServedBridgeClient >> serverBridge [
	^serverBridge
]

{ #category : 'accessing' }
PjLocalWebServedBridgeClient >> serverBridge: aBridge [ 

	serverBridge := aBridge
]

{ #category : 'accessing' }
PjLocalWebServedBridgeClient >> serverBridgeClient [

	^ serverBridge client
]

{ #category : 'actions' }
PjLocalWebServedBridgeClient >> serverClass [

	^ appClass serverAppClass
]

{ #category : 'actions' }
PjLocalWebServedBridgeClient >> start [

	serverBridge ifNil: [ self serverBridge: self serverClass bridge ].
	serverBridge isServerStarted ifFalse: [ serverBridge start. ].
	self initUrlString.
	super start
]

{ #category : 'actions' }
PjLocalWebServedBridgeClient >> stop [

	serverBridge ifNotNil: [
		serverBridge stop ].
	super stop
]

{ #category : 'actions' }
PjLocalWebServedBridgeClient >> urlPathString [

	^self appClass urlPathString 
]
