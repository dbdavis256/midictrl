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

@interface MidiInputHandlerNov : NSObject <MIDIReceiver> {
    MIDIWrapper *midi;
    MIDIDeviceRef launchpadX;
}

- (void)receiveMIDIInput: (NSArray *)packet;

@end
