#import "Tweak.h"

BOOL enabledHS;
BOOL enabledLS;
BOOL enableLSCornerRadius;
NSInteger wallBlurStyleHS;
NSInteger wallBlurStyleLS;
double alphaValueHS;
double alphaValueLS;
HBPreferences *preferences;

// Hook the HomeScreen View
%hook SBHomeScreenView

UIVisualEffectView *blurWallEffectViewHS;

-(void)didMoveToWindow {

    if (enabledHS) {

    %orig;

    // Create the Blur Effect
    UIBlurEffect *blurEffectHS;

        if (wallBlurStyleHS == 0) {
            blurEffectHS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
        }

        if (wallBlurStyleHS == 1) {
            blurEffectHS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterialLight];
        }

        if (wallBlurStyleHS == 2) {
            blurEffectHS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterialDark];
        }
    
        if (wallBlurStyleHS == 3) {
            blurEffectHS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterial];
        }

        if (wallBlurStyleHS == 4) {
            blurEffectHS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialLight];
        }

        if (wallBlurStyleHS == 5) {
            blurEffectHS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialDark];
        }

    // Add the Blur Effect to the View
    UIVisualEffectView *blurWallEffectViewHS = [[UIVisualEffectView alloc] initWithEffect:blurEffectHS];

    // Set the View frame to the frame of SBHomeScreenView
    blurWallEffectViewHS.frame = [UIScreen mainScreen].bounds;
    blurWallEffectViewHS.layer.masksToBounds = YES;

    // Allow users to set the opacity of the blur
    blurWallEffectViewHS.alpha = alphaValueHS;

    // Add the View to SBHomeScreenView, but specify that it is inserted to the first slot (puts it behind HomeScreen icons)
    [self insertSubview:blurWallEffectViewHS atIndex:0];

    // Constraints for devices that allow rotation on homescreen
    blurWallEffectViewHS.translatesAutoresizingMaskIntoConstraints = false;
    [blurWallEffectViewHS.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0].active = YES;
    [blurWallEffectViewHS.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0].active = YES;
    [blurWallEffectViewHS.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0].active = YES;
    [blurWallEffectViewHS.topAnchor constraintEqualToAnchor:self.topAnchor constant:0].active = YES;

    }

    %orig;

}

%end

// Hook the LockScreen View
%hook SBUIBackgroundView

UIVisualEffectView *blurWallEffectViewLS;

-(void)didMoveToWindow {

    if (enabledLS) {

    %orig;

    // Create the Blur Effect
    UIBlurEffect *blurEffectLS;

        if (wallBlurStyleLS == 0) {
            blurEffectLS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
        }

        if (wallBlurStyleLS == 1) {
            blurEffectLS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterialLight];
        }

        if (wallBlurStyleLS == 2) {
            blurEffectLS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterialDark];
        }
    
        if (wallBlurStyleLS == 3) {
            blurEffectLS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterial];
        }

        if (wallBlurStyleLS == 4) {
            blurEffectLS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialLight];
        }

        if (wallBlurStyleLS == 5) {
            blurEffectLS = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialDark];
        }

    // Add the Blur Effect to the View
    UIVisualEffectView *blurWallEffectViewLS = [[UIVisualEffectView alloc] initWithEffect:blurEffectLS];

    // Set the View frame to the frame of SBUIBackgroundView
    blurWallEffectViewLS.frame = [UIScreen mainScreen].bounds;
    blurWallEffectViewLS.layer.masksToBounds = YES;

    // Allow users to set the opacity of the blur
    blurWallEffectViewLS.alpha = alphaValueLS;

    // Add the View to SBUIBackgroundView, but specify that it is inserted to the first slot (puts it behind the clock/quick actions toggles)
    [self insertSubview:blurWallEffectViewLS atIndex:0];

    // Constraints for devices that allow rotation on lockscreen
    blurWallEffectViewLS.translatesAutoresizingMaskIntoConstraints = false;
    [blurWallEffectViewLS.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0].active = YES;
    [blurWallEffectViewLS.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0].active = YES;
    [blurWallEffectViewLS.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0].active = YES;
    [blurWallEffectViewLS.topAnchor constraintEqualToAnchor:self.topAnchor constant:0].active = YES;

    }

    %orig;

}

%end

%ctor {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.nahtedetihw.blurwallprefs"];
    [preferences registerBool:&enabledHS default:NO forKey:@"enabledHS"];
    [preferences registerInteger:&wallBlurStyleHS default:0 forKey:@"wallBlurStyleHS"];
    [preferences registerBool:&enabledLS default:NO forKey:@"enabledLS"];
    [preferences registerBool:&enableLSCornerRadius default:NO forKey:@"enableLSCornerRadius"];
    [preferences registerInteger:&wallBlurStyleLS default:0 forKey:@"wallBlurStyleLS"];
    [preferences registerDouble:&alphaValueHS default:1.0 forKey:@"alphaValueHS"];
    [preferences registerDouble:&alphaValueLS default:1.0 forKey:@"alphaValueLS"];

}
