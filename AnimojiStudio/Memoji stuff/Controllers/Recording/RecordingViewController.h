//
//  RecordingViewController.h
//  AnimojiStudio
//
//  Created by Guilherme Rambo on 11/11/17.
//  Copyright © 2017 Guilherme Rambo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecordingViewController;

@protocol RecordingViewControllerDelegate <NSObject>

- (void)recordingViewControllerDidTapRecord:(RecordingViewController *)controller;
- (void)recordingViewControllerDidTapBroadcast:(RecordingViewController *)controller;
- (void)recordingViewControllerDidTapKaraoke:(RecordingViewController *)controller;
- (BOOL)recordingViewControllerDidTapKaraokePlayPause:(RecordingViewController *)controller;
//changed: Added function for isRecording for my UI + AR
- (BOOL)isRecording;
@end

@interface RecordingViewController : UIViewController

@property (nonatomic, weak) id<RecordingViewControllerDelegate> delegate;

@property (nonatomic, copy) NSString *puppetName;
@property (nonatomic, strong) id avatar;

- (void)hideControls;
- (void)showControls;
- (void)becomeKaraoke;

@property (nonatomic, assign, getter=isMicrophoneEnabled) BOOL microphoneEnabled;

@end
