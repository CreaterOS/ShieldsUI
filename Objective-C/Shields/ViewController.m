//
//  ViewController.m
//  Shields
//
//  Created by Mac on 2021/5/21.
//

#import "ViewController.h"
#import "Shields.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Shields *shields = [[Shields alloc] initWithFrame:CGRectMake(0, 0, 320, 40) style:ShieldsLogo];
//    [shields configLabel:@"CreaterOS" message:@"v1.0"];
//    [shields configLabel:@"CreaterOS" message:@"v1.0" labelColor:[UIColor colorWithRed: 86/255.0 green: 88/255.0 blue: 224/255.0 alpha:1.000]];
//    [shields configLabel:@"CreaterOS" message:@"v1.0" messageColor:[UIColor colorWithRed: 86/255.0 green: 88/255.0 blue: 224/255.0 alpha:1.000]];
//    [shields configLabel:@"CreaterOS" message:@"v1.0" labelBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000]];
//    [shields configLabel:@"CreaterOS" message:@"v1.0" messageBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000]];
//    [shields configLabel:@"CreaterOS" message:@"v1.0" labelBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000] messageBackgroundColor:[UIColor colorWithRed: 86/255.0 green: 88/255.0 blue: 224/255.0 alpha:1.000]];
    [shields configLabel:@"CreaterOS" message:@"v1.0" labelBackgroundColor:[UIColor colorWithRed: 86/255.0 green: 88/255.0 blue: 224/255.0 alpha:1.000] messageBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000] labelColor:UIColor.whiteColor messageColor:UIColor.whiteColor];
    shields.center = self.view.center;
    [self.view addSubview:shields];
    
    
//    [shields configLabel:@"CreaterOS" message:@"v1.0" labelBackgroundColor:[UIColor colorWithRed: 151/255.0 green: 229/255.0 blue: 241/255.0 alpha:1.000] messageBackgroundColor:[UIColor colorWithRed: 93/255.0 green: 241/255.0 blue: 40/255.0 alpha:1.000] labelColor:[UIColor colorWithRed: 71/255.0 green: 67/255.0 blue: 78/255.0 alpha:1.000] messageColor:[UIColor colorWithRed: 71/255.0 green: 67/255.0 blue: 78/255.0 alpha:1.000]];
   
//    [shields configLabel:@"CreaterOS" message:@"v1.0" labelBackgroundColor:[UIColor colorWithRed: 241/255.0 green: 176/255.0 blue: 101/255.0 alpha:1.000] messageBackgroundColor:[UIColor colorWithRed: 193/255.0 green: 241/255.0 blue: 172/255.0 alpha:1.000] labelColor:[UIColor colorWithRed: 242/255.0 green: 242/255.0 blue: 246/255.0 alpha:1.000] messageColor:[UIColor colorWithRed: 242/255.0 green: 242/255.0 blue: 246/255.0 alpha:1.000] logo:[UIImage imageNamed:@"lanmei"] logoWidth:15 logoPosition:CGPointMake(10, 10)];
    
//    shields.messageWidth = 100;
    shields.cornerRadius = 20;
    
    [shields configWithJsonFilePath:[[NSBundle mainBundle] pathForResource:@"shields" ofType:@"json"]];
    
}


@end
