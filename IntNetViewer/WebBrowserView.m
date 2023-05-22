//
//  WebBrowserView.m
//  IntNetViewer
//
//  Created by robloxboy1000 on 5/20/23.
//  Copyright © 2023 robloxboy1000. All rights reserved.
//

#import "WebBrowserView.h"

@implementation WebBrowserView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Set the delegate for the WebView
    self.webView.frameLoadDelegate = self;
    self.webView.resourceLoadDelegate = self;
    [self.webView.preferences setJavaScriptEnabled:YES];
    
    
}

- (IBAction)goBackButtonClicked:(id)sender {
    [self.webView goBack];
}

- (IBAction)goForwardButtonClicked:(id)sender {
    [self.webView goForward];
}

- (IBAction)goButtonClicked:(id)sender {
    NSString *urlString = self.urlTextField.stringValue;
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url) {
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView.mainFrame loadRequest:request];
    }
}

- (IBAction)reloadButtonClicked:(id)sender {
    [self.webView reload:nil];
}
#pragma mark - WebFrameLoadDelegate

- (void)webView:(WebView *)sender didStartProvisionalLoadForFrame:(WebFrame *)frame {
    // Show the progress indicator
    [self.progressIndicator startAnimation:nil];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {
    // Hide the progress indicator
    [self.progressIndicator stopAnimation:nil];
}

- (void)webView:(WebView *)sender didFailLoadWithError:(NSError *)error forFrame:(WebFrame *)frame {
    // Hide the progress indicator in case of load failure
    [self.progressIndicator stopAnimation:nil];
}

- (void)webView:(WebView *)sender didReceiveTitle:(NSString *)title forFrame:(WebFrame *)frame {
    // Update the window title with the webpage title
    [self.window setTitle:title];
}

- (void)webView:(WebView *)sender didReceiveIcon:(NSImage *)image forFrame:(WebFrame *)frame {
    // Update the window's icon with the webpage icon
    [self.window setDocumentEdited:YES];
    [self.window setRepresentedURL:[NSURL URLWithString:sender.mainFrameURL]];
}


- (void)webView:(WebView *)sender didChangeLocationWithinPageForFrame:(WebFrame *)frame {
    // Update the URL text field when navigating within a page
    NSString *currentURLString = sender.mainFrameURL;
    self.urlTextField.stringValue = currentURLString;
}

- (void)updateNavigationButtons {
    self.backButton.enabled = self.webView.canGoBack;
    self.forwardButton.enabled = self.webView.canGoForward;
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if (error.code == 1100) {
        NSAlert *alert = [[NSAlert alloc] init];
        alert.messageText = @"Error";
        alert.informativeText = @"An error occurred during the URL connection.";
        [alert runModal];
    }
}

@end

