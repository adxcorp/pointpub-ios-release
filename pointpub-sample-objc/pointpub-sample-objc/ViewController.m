//
//  ViewController.m
//  pointpub-sample-objc
//
//  Created by neptune on 9/8/25.
//

#import "ViewController.h"
#import "PointPubSDK/PointPubSDK-Swift.h"

@interface ViewController () <PointPubDelegate>
@property (weak, nonatomic) IBOutlet UIButton *enterButton;
@property (weak, nonatomic) IBOutlet UIButton *getVirtualPointButton;
@property (weak, nonatomic) IBOutlet UIButton *spendVirtualPointButton;
@property (weak, nonatomic) IBOutlet UIButton *getCampaignButton;

@end

@implementation ViewController

// NSString *appId = "<ENTER YOUR APP ID>"
NSString *appId = @"APP_17569663893761798";
// NSString *userId = "<ENTER YOUR USER ID>"
NSString *userId = @"123456789";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [
        [UITapGestureRecognizer alloc] initWithTarget: self action: @selector(didTapView)
    ];
    [self.view addGestureRecognizer:tapGesture];
    
    _enterButton.layer.cornerRadius = 12;
    _getVirtualPointButton.layer.cornerRadius = 12;
    _spendVirtualPointButton.layer.cornerRadius = 12;
    _getCampaignButton.layer.cornerRadius = 12;
    
    PointPub.delegate = self;
    [PointPub setAppIdWith: appId];
    [PointPub setUserIdWith: userId];
    if (!PointPub.isTrackingEnabled) {
        [PointPub requestTrackingPermission:^(BOOL isTrackingPermission) {
            
        }];
    }
}

- (void)didTapView {
    [self.view endEditing:YES];
}

- (IBAction)didTapEnterButton:(id)sender {
    [PointPub startOfferwallFrom: self];
}

- (IBAction)didTapGetVirtualPoint:(id)sender {
    [PointPub getVirtualPoint:^(NSString *name, NSNumber *point, NSError *error) {
        if (error) {
            NSLog(@"❌ Error: %@", error.localizedDescription);
        } else {
            NSLog(@"✅ 포인트명: %@, 포인트 잔액: %ld", name, [point longValue]);
        }
    }];
}

- (IBAction)didTapSpendVirtualPoint:(id)sender {
    [self spendAllVirtualPointsIfAvailable];
}

- (void)spendAllVirtualPointsIfAvailable {
    [PointPub getVirtualPoint:^(NSString *name, NSNumber *remainingPoint, NSError *error) {
        if (error) {
            NSLog(@"❌ Error: %@", error.localizedDescription);
        } else {
            NSLog(@"✅ 포인트명: %@, 포인트 잔액: %ld", name, [remainingPoint longValue]);
            
            if ([remainingPoint intValue] > 0) {
                [self spendVirtualPoint:remainingPoint];
            }
        }
    }];
}

- (void)spendVirtualPoint:(NSNumber*)amount {
    [PointPub spendVirtualPointWithPoint:amount:^(NSString *name, NSNumber *point, NSError *error) {
        if (error) {
            NSLog(@"❌ Error: %@", error.localizedDescription);
        } else {
            NSLog(@"✅ 포인트명: %@, 포인트 잔액: %ld", name, [point longValue]);
        }
    }];
}

- (IBAction)didTapGetCompletedCampaign:(id)sender {
    [PointPub getCompletedCampaign:^(NSString *response, NSError *error) {
        if (error) {
            NSLog(@"❌ Error: %@", error.localizedDescription);
        } else {
            NSLog(@"✅ response: %@", response);
        }
    }];
}

- (void)onOpenOfferwall {
    NSLog(@"onOpenOfferwall");
}

- (void)onCloseOfferwall {
    NSLog(@"onCloseOfferwall");
}

@end
