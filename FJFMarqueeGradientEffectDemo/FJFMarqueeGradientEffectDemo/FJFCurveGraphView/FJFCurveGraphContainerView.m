//
//  FJFCurveGraphContainerView.m
//  FJFMarqueeGradientEffectDemo
//
//  Created by macmini on 04/12/2019.
//  Copyright © 2019 macmini. All rights reserved.
//

// view
#import "FJFCurveGraphContainerView.h"

@implementation FJFCurveGraphContainerView
#pragma mark - Life Circle
- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame curveGraphViewStyle:[[FJFCurveGraphViewStyle alloc] init] backgroundViewStyle:[[FJFCurveGraphBackgroundViewStyle alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame
          curveGraphViewStyle:(FJFCurveGraphViewStyle *)curveGraphViewStyle
          backgroundViewStyle:(FJFCurveGraphBackgroundViewStyle *)backgroundViewStyle{
    if (self = [super initWithFrame:frame]) {
        [self setupViewControls];
        [self layoutViewControls];
    }
    return self;
}

#pragma mark - Public Methods
- (void)updateViewControls {
    [self.backgroundView updateViewControls];
    [self layoutViewControls];
    [self.curveGraphView updateViewControls];
}

#pragma mark - Private Methods

- (void)setupViewControls {
    [self addSubview:self.backgroundView];
    [self addSubview:self.curveGraphView];
}

- (void)layoutViewControls {
    self.backgroundView.frame = self.bounds;
    
    // curveGraphView
    self.curveGraphView.frame = self.backgroundView.curveGraphLineContainerView.frame;
}

#pragma mark - Setter / Getter

- (FJFCurveGraphViewStyle *)curveGraphViewStyle {
    return self.curveGraphView.viewStyle;
}

- (FJFCurveGraphBackgroundViewStyle *)backgroundViewStyle {
    return self.backgroundView.viewStyle;
}


// curveGraphView
- (FJFCurveGraphView *)curveGraphView {
    if (!_curveGraphView) {
        _curveGraphView = [[FJFCurveGraphView alloc] initWithFrame:self.backgroundView.curveGraphLineContainerView.frame];
    }
    return _curveGraphView;
}

// curveGraphView
- (FJFCurveGraphBackgroundView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[FJFCurveGraphBackgroundView alloc] initWithFrame:self.bounds];
    }
    return _backgroundView;
}
@end
