//
//  ComSvprogresshudViewProxy.m
//  svprogresshud
//
//  Created by Riley Dutton on 4/27/11.
//

#import "ComSvprogresshudViewProxy.h"


@implementation ComSvprogresshudViewProxy

-(void)showHUD:(id)args
{
	[[self view] performSelectorOnMainThread:@selector(showHUD:) withObject:args waitUntilDone:NO];
}

-(void)dismissHUD:(id)args
{
    [[self view] performSelectorOnMainThread:@selector(dismissHUD:) withObject:args waitUntilDone:NO];
}

-(void)setStatus:(id)args
{
    [[self view] performSelectorOnMainThread:@selector(setStatus:) withObject:args waitUntilDone:NO];
}

@end
