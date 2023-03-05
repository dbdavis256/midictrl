//
//  MidiInputHandler.h
//  MidiTest
//
//  Created by David Davis on 1/16/23.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>
#import "MIDIReceiver.h"

@interface MidiInputHandler : NSObject <MIDIReceiver> {
    CGPoint mouseForwardLoc;
    CGPoint mouseBackLoc;
}

- (void)receiveMIDIInput: (NSArray *)packet;

@end
