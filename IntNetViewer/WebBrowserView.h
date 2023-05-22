//
//  WebBrowserView.h
//  IntNetViewer
//
//  Created by robloxboy1000 on 5/20/23.
//  Copyright © 2023 robloxboy1000. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface WebBrowserView : NSView <WebFrameLoadDelegate, WebResourceLoadDelegate>

@property (nonatomic, weak) IBOutlet WebView *webView;
@property (nonatomic, weak) IBOutlet NSTextField *urlTextField;
@property (nonatomic, weak) IBOutlet NSButton *backButton;
@property (nonatomic, weak) IBOutlet NSButton *forwardButton;
@property (nonatomic, weak) IBOutlet NSButton *reloadButton;
@property (nonatomic, weak) IBOutlet NSButton *goButton;
@property (nonatomic, weak) IBOutlet NSProgressIndicator *progressIndicator;

- (IBAction)goBackButtonClicked:(id)sender;
- (IBAction)goForwardButtonClicked:(id)sender;
- (IBAction)goButtonClicked:(id)sender;
- (IBAction)reloadButtonClicked:(id)sender;

@end

