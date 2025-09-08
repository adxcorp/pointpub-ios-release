//
//  ViewController.m
//  pointpub-sample-objc
//
//  Created by choiseungmyeong on 9/8/25.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *enterButton;
@property (weak, nonatomic) IBOutlet UIButton *getVirtualPointButton;
@property (weak, nonatomic) IBOutlet UIButton *spendVirtualPointButton;
@property (weak, nonatomic) IBOutlet UIButton *getCampaignButton;

@end

@implementation ViewController

NSString *defaultValue = @"123456789";

- (void)didTapView {
    [self.view endEditing:YES];
}

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
}

- (IBAction)didTapEnterButton:(id)sender {
    
}

- (IBAction)didTapGetVirtualPoint:(id)sender {
    
}

- (IBAction)didTapSpendVirtualPoint:(id)sender {
    
}

- (IBAction)didTapGetCompletedCampaign:(id)sender {
    
}

//- (void)onOpenOfferwall {
//    NSLog(@"onOpenOfferwall");
//}
//
//- (void)onCloseOfferwall {
//    NSLog(@"onCloseOfferwall");
//}

@end
