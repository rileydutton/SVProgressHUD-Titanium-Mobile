//
//  ComSvprogresshudView.m
//  svprogresshud
//
//  Created by Riley Dutton on 4/27/11.
//

#import "ComSvprogresshudView.h"
#import "TiUtils.h"
#import "SVProgressHUD.h"

@implementation ComSvprogresshudView

-(void)dealloc
{
    RELEASE_TO_NIL(square);
    [super dealloc];
}

-(UIView*)square
{
    if (square==nil)
    {
        square = [[UIView alloc] initWithFrame:[self frame]];
        [self addSubview:square];
    }
    return square;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (square!=nil)
    {
        [TiUtils setView:square positionRect:bounds];
    }
}

#pragma mark Public APIs

-(void)showHUD:(id)args
{
    ENSURE_SINGLE_ARG(args,NSDictionary);
    UIView *s = [self square];
    [SVProgressHUD showInView:s status:[args objectForKey:@"status"] networkIndicator:(BOOL)[args objectForKey:@"showNetwork"]];
}

-(void)dismissHUD:(id)args
{
    ENSURE_SINGLE_ARG(args,NSDictionary);
    if([args objectForKey:@"error"] == nil) {
        [SVProgressHUD dismiss];
    }
    else if((BOOL)[args objectForKey:@"error"] == true) {
        [SVProgressHUD dismissWithSuccess:[args objectForKey:@"status"]];
    }
    else {
        [SVProgressHUD dismissWithError:[args objectForKey:@"status"]];
    }
}

-(void)setStatus:(NSString*)status
{
    [SVProgressHUD setStatus:status];
}

@end
