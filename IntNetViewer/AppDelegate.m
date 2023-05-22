//
//  AppDelegate.m
//  IntNetViewer
//
//  Created by robloxboy1000 on 11/22/21.
//  Copyright © 2021 robloxboy1000. All rights reserved.
//

#import "AppDelegate.h"
#import "WebBrowserView.h"

@interface AppDelegate ()

@property (weak) IBOutlet WebBrowserView *webBrowserView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Create an instance of WebBrowserView
    self.webBrowserView = [[WebBrowserView alloc] initWithFrame:self.window.contentView.bounds];
    
    // Add the web browser view to the window or superview
    [self.window.contentView addSubview:self.webBrowserView];
}
@end
