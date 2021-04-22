//
//  AppDelegate.m
//  AnimojiStudio
//
//  Created by Guilherme Rambo on 11/11/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

#import "AppDelegate.h"

#import "ASAppearance.h"

#import "ErrorViewController.h"
#import "RecordingFlowController.h"

#import "SpotifyCoordinator.h"

#import "MemojiSupport.h"

@interface AppDelegate ()

@property (nonatomic, strong) RecordingFlowController *recordingFlow;
@property (nonatomic, strong) SpotifyCoordinator *spotifyCoordinator;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ASAppearance install];
    
    self.spotifyCoordinator = [SpotifyCoordinator new];
    
    self.window = [UIWindow new];
    
    [self.window setOpaque:YES];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    if (![[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AvatarKit.framework"] load]) {
        [self showErrorMessage:@"This app is only supported on devices with a TrueDepth camera."];
        [self.window makeKeyAndVisible];
        return YES;
    }
    
    self.recordingFlow = [RecordingFlowController new];

    [MemojiSupport prepareMemojiRuntime];

    self.recordingFlow.supportsMemoji = [MemojiSupport deviceSupportsMemoji];

    self.recordingFlow.spotifyCoordinator = self.spotifyCoordinator;
    
    [self.window setRootViewController:self.recordingFlow];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)showErrorMessage:(NSString *)errorMessage
{
    ErrorViewController *controller = [ErrorViewController new];
    controller.message = errorMessage;
    [self.window setRootViewController:controller];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    return [self.spotifyCoordinator handleCallbackURL:url];
}

//Changed: Allow me to load app delegate manually from swift
- (BOOL)setUp{
    [ASAppearance install];
    
    self.spotifyCoordinator = [SpotifyCoordinator new];
    
    self.window = [UIWindow new];
    
    [self.window setOpaque:YES];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    if (![[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AvatarKit.framework"] load]) {
        [self showErrorMessage:@"This app is only supported on devices with a TrueDepth camera."];
        [self.window makeKeyAndVisible];
        return YES;
    }
    
    self.recordingFlow = [RecordingFlowController new];

    [MemojiSupport prepareMemojiRuntime];

    self.recordingFlow.supportsMemoji = [MemojiSupport deviceSupportsMemoji];

    self.recordingFlow.spotifyCoordinator = self.spotifyCoordinator;
    
    [self.window setRootViewController:self.recordingFlow];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
