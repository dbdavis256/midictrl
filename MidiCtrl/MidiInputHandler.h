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
#import "MIDIWrapper.h"

@interface MidiInputHandler : NSObject <MIDIReceiver> {
    MIDIWrapper *midi;
    MIDIDeviceRef pedal;
    
    CGPoint mouseForwardLoc;
    CGPoint mouseBackLoc;
}

- (void)receiveMIDIInput: (NSArray *)packet;

@end
