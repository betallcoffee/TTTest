//
//  TTSpringBoardServices.m
//  TTTest
//
//  Created by liang on 13/4/17.
//  Copyright © 2017年 tina. All rights reserved.
//

#include <dlfcn.h>

#import "TTSpringBoardServices.h"

#define UIKIT_PATH "/System/Library/Framework/UIKit.framework/UIKit"
#define SBSERV_PATH  "/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices"

typedef int (*SBSSpringBoardServerPort)();
typedef NSArray* (*SBSCopyApplicationDisplayIdentifiers)(mach_port_t* port, BOOL runningApps,BOOL debuggablet);

@interface TTSpringBoardServices ()
{
    SBSSpringBoardServerPort m_SBSSpringBoardServerPort;
    SBSCopyApplicationDisplayIdentifiers m_SBSCopyApplicationDisplayIndentifiers;
}

@end

@implementation TTSpringBoardServices

- (void)loadPrivateAPI
{
    void * uiKit = dlopen(UIKIT_PATH, RTLD_LAZY);
    m_SBSSpringBoardServerPort = dlsym(uiKit, "SBSSpringBoardServerPort");
    
    void *sbServ = dlopen(SBSERV_PATH, RTLD_LAZY);
    m_SBSCopyApplicationDisplayIndentifiers = dlsym(sbServ, "SBSCopyApplicationDisplayIdentifiers");
}

- (NSArray *)currentRunningApps
{
    if (m_SBSSpringBoardServerPort != NULL && m_SBSCopyApplicationDisplayIndentifiers != NULL) {
        mach_port_t *port = (mach_port_t *)m_SBSSpringBoardServerPort();
        if (port) {
            NSArray *apps = m_SBSCopyApplicationDisplayIndentifiers(port, YES, NO);
            if (apps) {
                return apps;
            }
        }
    }
    
    return @[];
}

@end
